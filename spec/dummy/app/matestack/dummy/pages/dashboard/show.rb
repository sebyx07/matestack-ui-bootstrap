class Dummy::Pages::Dashboard::Show < ApplicationPage

  include Dummy::Pages::Dashboard::CodeRenderingUtils

  def response
    render_dummy_and_code_in_tabs
  end

  def dummy_tab_content
    bs_page_heading title: t("dashboard.title"), subtitle: t("dashboard.subtitle")
    bs_row do
      bs_col md: 6 do
        analytics_partial
      end
      bs_col md: 6 do
        activity_partial
      end
    end
  end

  def analytics_partial
    async defer: true, id: "products-card" do
      dashboard_products
    end
    async defer: true, id: "revenue-card" do
      dashboard_revenue
    end
  end

  def activity_partial
    bs_row do
      bs_col do
        async defer: true, rerender_on: "activity-tracked", id: "activity-card" do
          dashboard_activity
        end
      end
    end
  end

end
