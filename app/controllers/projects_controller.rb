class ProjectsController < ApplicationController

  def index
    project_repo = TrackerSearch.new
    @project_hash = project_repo.all_projects
  end

  def show
    id = params[:id]
    tracker_search = TrackerSearch.new
    @stories = tracker_search.all_stories(id)
  end

end