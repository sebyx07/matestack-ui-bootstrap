require 'rails_helper'
require_relative "../../support/form_test_controller"

RSpec.describe "Bootstrap::Form::Input", type: :feature, js: true do
  include Utils

  before :all do
    Rails.application.routes.append do
      scope "form_checkbox_spec" do
        post '/checkbox_success_form_test', to: 'form_test#success_submit', as: 'checkbox_success_form_test'
        post '/checkbox_failure_form_test', to: 'form_test#failure_submit', as: 'checkbox_failure_form_test'
      end
    end
    Rails.application.reload_routes!
  end

  before :each do
    allow_any_instance_of(FormTestController).to receive(:expect_params)
  end

  xit 'renders single bootstrap checkbox button, simply submitting sends :nil' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_checkbox label: "Single checkbox", key: :some_checkbox_input_1
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="some_checkbox_input_1_1" and contains(@class, "form-check-input")]')

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { "some_checkbox_input_1"=>nil }))

    click_button "Submit"

  end

  xit 'renders single bootstrap checkbox button, clicking button and submitting sends :true' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_checkbox label: "Single checkbox", key: :some_checkbox_input_1
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="some_checkbox_input_1_1" and contains(@class, "form-check-input")]')

    find('#some_checkbox_input_1_1').click

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { "some_checkbox_input_1"=>true }))

    click_button "Submit"

  end

  xit 'renders single bootstrap checkbox button, clicking it twice submits :false again it' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_checkbox label: "Single checkbox", key: :some_checkbox_input_1
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="some_checkbox_input_1_1" and contains(@class, "form-check-input")]')

    find('#some_checkbox_input_1_1').click
    find('#some_checkbox_input_1_1').click

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { "some_checkbox_input_1"=>false }))

    click_button "Submit"
  end

  xit 'renders bootstrap checkbox button with options as Array' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_checkbox key: :foo, options: [1, 2]
        bs_form_submit text: "Submit"
      end
    end
    visit example_path

    expect(page).to have_xpath('//form//input[@id="foo_1" and contains(@class, "form-check-input")]')
    expect(page).to have_xpath('//form//input[@id="foo_2" and contains(@class, "form-check-input")]')

    find('#foo_1').click

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: [1] }))

    click_button "Submit"

  end

  xit 'renders bootstrap checkbox button with options as Hash' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_checkbox key: :foo, options: { "Option 1": 1, "Option 2": 2 }
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="foo_1" and contains(@class, "form-check-input")]')
    expect(page).to have_xpath('//form//input[@id="foo_2" and contains(@class, "form-check-input")]')

    find('#foo_1').click

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: ['1'] }))

    click_button "Submit"

  end

  xit 'renders bootstrap checkbox button with options as Array, clicking multiple options' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_checkbox key: :foo, options: [1, 2]
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="foo_1" and contains(@class, "form-check-input")]')
    expect(page).to have_xpath('//form//input[@id="foo_2" and contains(@class, "form-check-input")]')

    find('#foo_1').click
    find('#foo_2').click

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: [1,2] }))

    click_button "Submit"
  end

  xit 'renders bootstrap checkbox button with options as Hash, clicking multiple options' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_checkbox key: :foo, options: { "Option 1": 1, "Option 2": 2 }
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="foo_1" and contains(@class, "form-check-input")]')
    expect(page).to have_xpath('//form//input[@id="foo_2" and contains(@class, "form-check-input")]')

    find('#foo_1').click
    find('#foo_2').click

    expect_any_instance_of(FormTestController).to receive(:expect_params)
      .with(hash_including(wrapper: { foo: ['1','2'] }))

    click_button "Submit"

  end

  xit 'renders bootstrap checkbox button with server errors' do
    form_config = get_form_config(path: checkbox_failure_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_checkbox key: :foo, options: [1, 2]
        bs_form_submit text: "Submit"
      end
    end
    visit example_path

    click_button "Submit"

    expect(page).to have_xpath('//form//input[@id="foo_2" and contains(@class, "is-invalid")]')

    expect(page).to have_xpath('//form//div//div[contains(@class, "invalid-feedback") and contains(text(), "can\'t be blank")]')
    expect(page).to have_xpath('//form//div//div[contains(@class, "invalid-feedback") and contains(text(), "is invalid")]')
  end

  xit 'renders bootstrap checkbox button with additional custom class' do
# add additional custom class to bootstrap checkbox

#     form_config = get_form_config(path: checkbox_success_form_test_path)
#     matestack_render do
#       matestack_form form_config do
#         bs_form_checkbox key: :foo, options: [1, 2], class: "some-class"
#         bs_form_submit text: "Submit"
#       end
#     end
#     visit example_path
#     expect(page).to have_xpath('//form//checkbox[@id="foo" and contains(@class, "form-checkbox") and contains(@class, "some-class")]')
  end

  xit 'renders disabled bootstrap checkbox buttons' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_checkbox key: :foo, options: [1, 2], disabled: true
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//input[@id="foo_1" and @disabled="disabled"]')
    expect(page).to have_xpath('//form//input[@id="foo_2" and @disabled="disabled"]')
  end

  xit 'renders bootstrap checkbox button with label' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_checkbox key: :foo, options: [1, 2], label: "Some label"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//label[@for="foo" and @class="form-label" and contains(text(), "Some label")]')
  end

  xit 'renders bootstrap checkbox button with form text' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_checkbox key: :foo, options: [1, 2], form_text: "some notes"
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//div[contains(@class, "form-text-for-foo") and contains(@class, "form-text") and contains(text(), "some notes")]')
  end

  xit 'renders bootstrap checkbox button as inline variant' do
    form_config = get_form_config(path: checkbox_success_form_test_path)
    matestack_render do
      matestack_form form_config do
        bs_form_checkbox key: :foo, options: [1, 2], variant: :inline
        bs_form_submit text: "Submit"
      end
    end
    visit example_path
    expect(page).to have_xpath('//form//div[contains(@class, "form-check-inline")]')
    expect(page).to have_xpath('//form//input[@id="foo_1" and contains(@class, "form-check-input")]')
    expect(page).to have_xpath('//form//input[@id="foo_2" and contains(@class, "form-check-input")]')
  end

end
