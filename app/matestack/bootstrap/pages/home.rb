class Bootstrap::Pages::Home < Matestack::Ui::Page

  def response
    container size: :xl, class: "bg-light py-5" do

      heading size: 2, text: "Addon Testing"

      row horizontal: "start", vertical: :start, class: "bg-secondary px-3" do
        col sm: 12, md: 4, lg: 4, class: "bg-warning" do          
          paragraph text: "Test"
        end
        col sm: 12, md: 4, lg: 4, order_lg: 5, class: "bg-info" do          
          paragraph text: "Test 2"
        end
        col md: 4, order_lg: 1, class: "bg-primary" do
          paragraph text: "Test 3"
        end
      end
      row id: "second_row", class: "my-3", horizontal: :evenly do
        col default: 12, md: 3, class: "bg-primary border", align_self: :center do
          paragraph text: "Second Row, Col 1"
        end
        col default: 12, md: 3, class: "bg-warning", align_self: :start do
          paragraph text: "Second Row, Col 2"
        end
        col default: 12, md: 3, class: "bg-secondary", align_self: :end do
          paragraph text: "Second Row, Col 3"
        end
      end
    end
    container size: :lg, class: "bg-dark py-4" do
      row do
        col do
          btn_group size: 1, label: "Basic Example 2" do 
            btn text: "Tab 4"
            btn text: "Tab 5"
            btn text: "Tab 6"
          end

          btn_group type: :toolbar, class: "justify-content-between my-2", label: "Toolbar" do            
            btn_group type: :group, vertical: true, label: "Basic Example" do 
              btn text: "Tab 1"
              btn text: "Tab 2"
              btn text: "Tab 3"
            end
            btn_group type: :group, size: 3, label: "Basic Example 2" do 
              btn text: "Tab 4"
              btn text: "Tab 5"
              btn text: "Tab 6"
            end
          end

          btn text: "Button", size: 2, style: :outline_primary
          btn text: "Button with Badge" do
            badge text: "primary", color: :success, class: "text-dark"
          end
          link path: "https://matestack.io" do
            # btn text: "Matestack", style: :link
            close
          end
        end
      end
    end

    container size: :lg, class: "bg-dark py-4 my-4" do
      row do
        progress height: 40, value: 80, text: "50%", color: "success", striped: true, animated: true 
      end
    end

    container size: :fluid, class: "py-3 mb-3" do
      row do
        3.times do
          col md: 4 do
            card title: "Card Title",
              header: "Card header", header_class: "h2 text-center",
              img_path: image_url("matestack-data.png"),
              footer: "2 days", footer_class: "text-muted",
              slots: { title: my_card_title, actions: my_card_actions, lists: my_card_lists } do
                paragraph text: "Some quick example text to build"
                link class: 'btn btn-primary', text: "crazy action", path: "#"
              end
          end
        end
      end
    end

  end

  def badge_element
    slot {
      badge text: "2"
    }
  end

  def my_card_title 
    slot {
      span text: "crazy header"
    }
  end

  def my_card_lists
    slot {
      ul class: 'list-group list-group-flush' do
        li class: "list-group-item" do plain "Item 1" end
        li class: "list-group-item" do plain "Item 2" end
        li class: "list-group-item" do plain "Item 3" end
      end
    }
  end

  def my_card_actions 
    slot {
      link class: 'btn btn-primary', text: "crazy action", path: "#"
    }
  end
end