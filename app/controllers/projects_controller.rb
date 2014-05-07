class ProjectsController < ApplicationController

  def index
    #get the list from tracker api call
    project_repo = TrackerSearch.new
    @projects = project_repo.all
  end

end