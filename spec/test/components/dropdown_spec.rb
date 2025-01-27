require 'rails_helper'

describe 'Bootstrap::Components::Dropdown', type: :feature, js: true do
  include Utils

  xit 'renders basic dropdown' do
    matestack_render do
      bs_dropdown
    end
    visit example_path
    expect(page).to have_selector('div.dropdown')
    expect(page).to have_selector('button.btn.btn-primary.dropdown-toggle')
  end

  xit 'has custom button with text' do
    matestack_render do
      bs_dropdown variant: :secondary, text: "Dropdown"
    end
    visit example_path
    expect(page).to have_selector('button.btn.btn-secondary.dropdown-toggle')
    expect(page).to have_content('Dropdown')
  end

  xit 'has a dropdown menu item' do
    matestack_render do
      bs_dropdown text: "Dropdown", menu: [
        { type: :link, path: "#", text: "Nulla vitae elit" },
        { type: :button, text: "Action" },
        { type: :divider },
        { type: :link, path: "#", text: "Separated link" }
      ]
    end
    visit example_path
    expect(page).to have_selector('div.dropdown')
    expect(page).to_not have_content('Nulla vitae elit')
    click_on('Dropdown')
    expect(page).to have_content('Nulla vitae elit')
    expect(page).to have_selector('li > button.btn.btn-primary.dropdown-item')
    expect(page).to have_selector('li > hr.dropdown-divider')
  end

  xit 'has a block yiel after menu' do
    matestack_render do
      bs_dropdown text: "Dropdown", menu: [
        { type: :link, path: "#", text: "Nulla vitae elit" },
        { type: :button, text: "Action" }
      ] do
        paragraph text: "Test Block"
      end
    end
    visit example_path
    expect(page).to have_selector('div.dropdown')
    expect(page).to_not have_content('Test Block')
    click_on('Dropdown')
    expect(page).to have_content('Nulla vitae elit')
    expect(page).to have_content('Test Block')
    expect(page).to have_selector('ul.dropdown-menu.show > p')
  end

  xit 'has a custom class for menu' do
    matestack_render do
      div attributes: { style: "height: 500px;" } do
        bs_dropdown text: "Dropdown", menu: { items: [
          { type: :link, path: "#", text: "Nulla vitae elit" },
          { type: :button, text: "Action" },
          { type: :divider },
          { type: :link, path: "#", text: "Separated link" }
        ], class: "foobar" }
      end
    end
    visit example_path
    expect(page).to have_selector('div.dropdown')
    click_on('Dropdown')
    expect(page).to have_content('Nulla vitae elit')
    expect(page).to have_selector('li > button.btn.btn-primary.dropdown-item')
    expect(page).to have_selector('ul.dropdown-menu.foobar')
  end

  xit 'can have a  split button using slot' do
    ExamplePage.define_method(:split_btn) do |*args|
      bs_btn text: "Split Button"
    end
    matestack_render do
      bs_dropdown slots: { split_btn: method(:split_btn) }
    end
    visit example_path
    expect(page).to have_content('Split Button')
    expect(page).to have_selector('button.btn.btn-primary.dropdown-toggle.dropdown-toggle-split')
  end

  xit 'can have different direction' do
    matestack_render do
      bs_dropdown text: "Dropdown", menu: [
        { type: :link, path: "#", text: "Nulla vitae elit" },
        { type: :button, text: "Action" },
      ], direction: :right
    end
    visit example_path
    expect(page).to have_selector('div.dropdown.dropright')
    click_on('Dropdown')
    expect(page).to have_content('Nulla vitae elit')
  end

  xit 'can have different alignment' do
    matestack_render do
      bs_dropdown text: "Dropdown", menu: [
        { type: :link, path: "#", text: "Nulla vitae elit" },
        { type: :button, text: "Action" },
      ], align: :center
    end
    visit example_path
    click_on('Dropdown')
    expect(page).to have_selector('ul.dropdown-menu.dropdown-menu-center')
  end

  xit 'can have an offset for menu' do
    matestack_render do
      bs_dropdown offset: "10,22", text: "Dropdown"
    end
    visit example_path
    expect(page).to have_selector('button.btn.btn-primary.dropdown-toggle[data-offset="10,22"]')
    expect(page).to have_content('Dropdown')
  end

  xit 'can have action, transition and onclick components as items' do
    pending "test for correct link, transition, action and onclick behavior"
    fail
    matestack_render do
      div attributes: { style: "height: 500px;" } do
        bs_dropdown text: "Dropdown", menu: [
          { type: :link, path: "#", text: "Link" },
          { type: :transition, path: root_path, text: "Transition" },
          { type: :action, path: root_path, method: :post, text: "Action" },
          { type: :onclick, emit: "test", text: "Onclick" }
        ]
      end
    end
    visit example_path
    expect(page).to have_content('Dropdown')
  end

end
