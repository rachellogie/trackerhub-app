require 'spec_helper'

feature 'user viewing Projects' do
  scenario 'user can view projects on homepage' do

    visit '/'
    click_on "View Projects"

    expect(page).to have_content("Logie and Clowes TrackerHub Project")
    expect(page).to have_content("Gluten Free App")
  end
end


