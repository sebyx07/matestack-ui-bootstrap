require 'rails_helper'
require_relative "../../support/form_test_controller"

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

  xit 'renders basic bootstrap input field' do
    form_config = get_form_config(path: input_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_input key: :foo, type: :text
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_selector('form > div.matestack-ui-bootstrap-input > input.form-control#foo[type="text"]')

    fill_in "foo", with: "bar"

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: "bar" }))

    click_button "Submit"
  end

  xit 'renders basic bootstrap input field with server errors' do
    form_config = get_form_config(path: input_failure_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_input key: :foo, type: :text
        bs_form_submit text: "Submit"
      end
    end
    visit example_path

    click_button "Submit"

    expect(page).to have_xpath('//form//input[@id="foo" and contains(@class, "form-control") and contains(@class, "is-invalid")]')

    expect(page).to have_xpath('//form//div[contains(@class, "invalid-feedback") and contains(text(), "can\'t be blank")]')
    expect(page).to have_xpath('//form//div[contains(@class, "invalid-feedback") and contains(text(), "is invalid")]')
  end

  xit 'renders basic bootstrap input field with additional custom class' do
    form_config = get_form_config(path: input_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_input key: :foo, type: :text, class: "some-class"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="foo" and contains(@class, "form-control") and contains(@class, "some-class")]')
  end

  xit 'renders basic bootstrap input field with label' do
    form_config = get_form_config(path: input_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_input key: :foo, type: :text, label: "Some label"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//label[@for="foo" and @class="form-label" and contains(text(), "Some label")]')
  end

  xit 'renders basic bootstrap input field with placeholder' do
    form_config = get_form_config(path: input_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_input key: :foo, type: :text, placeholder: "fill!"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="foo" and @placeholder="fill!" and contains(@class, "form-control")]')
  end

  xit 'renders basic bootstrap input field with form text' do
    form_config = get_form_config(path: input_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_input key: :foo, type: :text, form_text: "some notes"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//div[contains(@class, "form-text-for-foo") and contains(@class, "form-text") and contains(text(), "some notes")]')
  end

  xit 'renders basic bootstrap input field accepting float numbers' do
    form_config = get_form_config(path: input_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_input key: :foo, type: :number, step: 0.01
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    fill_in "foo", with: 1.45

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: 1.45 }))

    click_button "Submit"
  end

  xit 'renders basic bootstrap input field accepting float numbers as text with , delimeter via pattern regex' do
    form_config = get_form_config(path: input_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_input key: :foo, type: :text, pattern: "[0-9]+([,][0-9]+)?"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path

    fill_in "foo", with: "1.45"

    expect_any_instance_of(FormTestController).not_to receive(:expect_params)
      .with(hash_including(wrapper: { foo: "1.45" }))

    click_button "Submit"

    fill_in "foo", with: "1,45"

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: "1,45" }))

    click_button "Submit"
  end

  xit 'renders basic bootstrap range input' do
    form_config = get_form_config(path: input_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_input key: :foo, type: :range, min: 5, max: 11, step: 2, form_text: "some notes"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path

    expect(page).to have_selector('form > div.matestack-ui-bootstrap-input > input[type="range"][min="5"][max="11"][step="2"]')
    expect(page).to have_xpath('//form//div[contains(@class, "form-text-for-foo") and contains(@class, "form-text") and contains(text(), "some notes")]')
  end

end
