require 'rails_helper'

describe 'Components::Breadcrumb', type: :feature, js: true do
  include Utils

  it 'renders breadcrumb with transition' do
    matestack_render do
      breadcrumb items: {
        first: {
          type: :transition,
          path: "/",
          text: "Item 1",
        },
        second: {
          type: :transition,
          path: "#",
          text: "Item 1",
        }
      }
    end
    visit example_path
    expect(page).to have_selector('ol.breadcrumb')
    expect(page).to have_selector('li.breadcrumb-item.active')
  end

  it 'renders breadcrumb with link' do
    matestack_render do
      breadcrumb items: {
        first: {
          type: :link,
          path: "/",
          text: "Item 1",
        },
        second: {
          type: :link,
          path: "#",
          text: "Item 1",
        }
      }
    end
    visit example_path
    expect(page).to have_selector('ol.breadcrumb')
    expect(page).to have_selector('li.breadcrumb-item.active')
  end
end