require 'rails_helper'
require_relative "../../../support/form_test_controller"

RSpec.describe "Bootstrap::Form::Input", type: :feature, js: true do
  include Utils

  before :all do
    Rails.application.routes.append do
      scope "form_text_input_spec" do
        post '/input_success_form_test', to: 'form_test#success_submit', as: 'input_success_form_test'
        post '/input_failure_form_test', to: 'form_test#failure_submit', as: 'input_failure_form_test'
      end
    end
    Rails.application.reload_routes!
  end

  before :each do
    allow_any_instance_of(FormTestController).to receive(:expect_params)
  end

  it 'renders basic bootstrap input field' do
    form_config = get_form_config(path: input_success_form_test_path)
    matestack_render do
      form form_config do
        bootstrap_input key: :foo, type: :text
        bootstrap_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="foo" and contains(@class, "form-control")]')

    fill_in "foo", with: "bar"

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: "bar" }))

    click_button "Submit"
  end

  it 'renders basic bootstrap input field with server errors' do
    form_config = get_form_config(path: input_failure_form_test_path)
    matestack_render do
      form form_config do
        bootstrap_input key: :foo, type: :text
        bootstrap_submit text: "Submit"
      end
    end
    visit example_path

    click_button "Submit"

    expect(page).to have_xpath('//form//input[@id="foo" and contains(@class, "form-control") and contains(@class, "is-invalid")]')

    expect(page).to have_xpath('//form//div[contains(@class, "invalid-feedback") and contains(text(), "can\'t be blank")]')
    expect(page).to have_xpath('//form//div[contains(@class, "invalid-feedback") and contains(text(), "is invalid")]')
  end

  it 'renders basic bootstrap input field with additional custom class' do
    form_config = get_form_config(path: input_success_form_test_path)
    matestack_render do
      form form_config do
        bootstrap_input key: :foo, type: :text, class: "some-class"
        bootstrap_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="foo" and contains(@class, "form-control") and contains(@class, "some-class")]')
  end

  it 'renders basic bootstrap input field with label' do
    form_config = get_form_config(path: input_success_form_test_path)
    matestack_render do
      form form_config do
        bootstrap_input key: :foo, type: :text, label: "Some label"
        bootstrap_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//label[@for="foo" and @class="form-label" and contains(text(), "Some label")]')
  end

  it 'renders basic bootstrap input field with placeholder' do
    form_config = get_form_config(path: input_success_form_test_path)
    matestack_render do
      form form_config do
        bootstrap_input key: :foo, type: :text, placeholder: "fill!"
        bootstrap_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="foo" and @placeholder="fill!" and contains(@class, "form-control")]')
  end

  it 'renders basic bootstrap input field with form text' do
    form_config = get_form_config(path: input_success_form_test_path)
    matestack_render do
      form form_config do
        bootstrap_input key: :foo, type: :text, form_text: "some notes"
        bootstrap_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//div[@id="form_text_for_foo" and contains(@class, "form-text") and contains(text(), "some notes")]')
  end

end
