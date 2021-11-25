require 'rails_helper'

describe 'Bootstrap::Components::Badge', type: :feature, js: true do
  include Utils

  xit 'renders simple container' do
    matestack_render do
      bs_container do
        plain "Container"
      end
    end
    visit example_path
    expect(page).to have_selector('div.container')
  end

  xit 'renders container with size & custom classes' do
    matestack_render do
      bs_container size: :lg, class: "bg-warning py-3" do
        plain "Container"
      end
    end
    visit example_path
    expect(page).to have_selector('div.container-lg.bg-warning.py-3')

  end
end
