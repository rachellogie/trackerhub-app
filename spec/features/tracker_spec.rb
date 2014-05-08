require 'spec_helper'

feature 'user viewing Projects' do
  scenario 'user can view projects on homepage' do
    VCR.use_cassette('tracker/all_projects') do
      visit '/'
      click_on "View Projects"
      expect(page).to have_content("Logie and Clowes TrackerHub Project")
      expect(page).to have_content("Gluten Free App")
    end
  end

  scenario 'user can view stories associated with each project' do
    VCR.use_cassette('tracker/all_stories') do
      visit '/projects'
      click_on "Logie and Clowes TrackerHub Project"
      expect(page).to have_content("As an authenticated user, I can post a commit comment for my GitHub account")
    end
  end

  scenario 'user can view all tracker comments for a project' do
    VCR.use_cassette('tracker/all_tracker_comments') do
      visit '/projects'
      click_on "Logie and Clowes TrackerHub Project"
      expect(page).to have_content("This is a comment on the comment story")
    end
  end

end
