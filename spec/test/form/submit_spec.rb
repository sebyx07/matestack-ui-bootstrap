require 'rails_helper'
require_relative "../../support/form_test_controller"

RSpec.describe "Bootstrap::Form::Submit", type: :feature, js: true do
  include Utils

  before :all do
    Rails.application.routes.append do
      scope "form_submit_spec" do
        post '/delayed_success_submit', to: 'form_test#delayed_success_submit', as: 'delayed_success_submit'
        post '/submit_failure_form_test', to: 'form_test#failure_submit', as: 'submit_failure_form_test'
      end
    end
    Rails.application.reload_routes!
  end

  before :each do
    allow_any_instance_of(FormTestController).to receive(:expect_params)
  end

  xit 'renders a submit button with default classes & text' do
    form_config = get_form_config(path: delayed_success_submit_path)
    matestack_render do
      matestack_form form_config do
        bs_form_submit
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//button[@type="submit" and contains(@class, "btn btn-primary") and contains(text(), "Submit")]')
    click_button "Submit"
    expect(page).to have_xpath('//form//button[@type="submit" and contains(text(), "Loading")]')
  end

  xit 'renders a submit button with custom text and loading_text' do
    form_config = get_form_config(path: delayed_success_submit_path)
    matestack_render do
      matestack_form form_config do
        bs_form_submit text: "Submit!!", loading_text: "Getting submitted"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//button[@type="submit" and contains(@class, "btn btn-primary") and contains(text(), "Submit!!")]')
    click_button "Submit!!"
    expect(page).to have_xpath('//form//button[@type="submit" and contains(text(), "Getting submitted")]')
  end

  xit 'renders a submit button with default text & non-default button_variant and spinner_variant' do
    form_config = get_form_config(path: delayed_success_submit_path)
    matestack_render do
      matestack_form form_config do
        bs_form_submit button_variant: :light, spinner_variant: :dark
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//button[@type="submit" and contains(@class, "btn btn-light") and contains(text(), "Submit")]')
    click_button "Submit"
    expect(page).to have_xpath('//form//button[@type="submit" and contains(@class, "btn btn-light") and contains(text(), "Loading")]')
  end

  xit 'renders a submit button with default text & non-default button size' do
    form_config = get_form_config(path: delayed_success_submit_path)
    matestack_render do
      matestack_form form_config do
        bs_form_submit size: :lg
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//button[@type="submit" and contains(@class, "btn btn-primary btn-lg") and contains(text(), "Submit")]')
    click_button "Submit"
    expect(page).to have_xpath('//form//button[@type="submit" and contains(@class, "btn btn-primary btn-lg") and contains(text(), "Loading")]')
  end

  xit 'renders a submit button with non-default text,loading_text, button_variant, spinner_variant and size' do
    form_config = get_form_config(path: delayed_success_submit_path)
    matestack_render do
        matestack_form form_config do
            bs_form_submit button_variant: :light, spinner_variant: :dark, size: :lg, text: "Submit!!", loading_text: "Getting submitted"
        end
    end
    visit example_path
    expect(page).to have_xpath('//form//button[@type="submit" and contains(@class, "btn btn-light btn-lg") and contains(text(), "Submit!!")]')
    click_button "Submit!!"
    expect(page).to have_xpath('//form//button[@type="submit" and contains(@class, "btn btn-light btn-lg") and contains(text(), "Getting submitted")]')
  end

  xit 'renders a submit button with non-default [text,loading_text, button_variant, spinner_variant, size] and additional class&loading_class' do
    form_config = get_form_config(path: delayed_success_submit_path)
    matestack_render do
      matestack_form form_config do
        bs_form_submit button_variant: :light, spinner_variant: :dark, class: "custom-submit", loading_class: "custom-submit-loading", size: :lg, text: "Submit!!", loading_text: "Getting submitted"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//button[@type="submit" and contains(@class, "btn btn-light btn-lg custom-submit") and contains(text(), "Submit!!")]')
    click_button "Submit!!"
    expect(page).to have_xpath('//form//button[@type="submit" and contains(@class, "btn btn-light btn-lg custom-submit custom-submit-loading") and contains(text(), "Getting submitted")]')
  end

end
