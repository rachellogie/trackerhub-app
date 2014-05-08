class ProjectsController < ApplicationController

  def index
    project_repo = TrackerSearch.new
    @project_hash = project_repo.all_projects
  end

  def show
    project_id = params[:id]
    tracker_search = TrackerSearch.new
    @stories = tracker_search.all_stories(project_id)
    @tracker_comments = tracker_search.all_tracker_comments(project_id)
  end

end