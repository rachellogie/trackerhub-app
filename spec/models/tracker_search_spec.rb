require 'spec_helper'
require 'pp'

describe 'tracker search' do
  it 'returns a list of all projects' do
    VCR.use_cassette('tracker_search/all_projects') do
      tracker_search = TrackerSearch.new
      projects = tracker_search.all_projects
      expect(projects.second.values).to include("Gluten Free App")
      expect(projects.first.values).to include("Logie and Clowes TrackerHub Project")
    end
  end

  it 'returns a list of all stories' do
    VCR.use_cassette('tracker_search/all_stories') do
      tracker_search = TrackerSearch.new
      projects = tracker_search.all_stories(1075504)
      expect(projects).to include("As an authenticated user, I can post a commit comment for my GitHub account")
    end
  end

  it 'returns a list of all tracker comments' do
    VCR.use_cassette('tracker_search/all_tracker_comments') do
      tracker_search = TrackerSearch.new
      projects = tracker_search.all_tracker_comments(1075504)
      expect(projects).to include("This is a second test comment on the first story")
    end
  end
end