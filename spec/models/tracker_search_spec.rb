require 'spec_helper'
require 'pp'

describe 'tracker search' do
  it 'returns a list of all projects' do
    tracker_search = TrackerSearch.new
    projects = tracker_search.all
    expect(projects).to include("Gluten Free App")
    expect(projects).to include("Logie and Clowes TrackerHub Project")
  end
end