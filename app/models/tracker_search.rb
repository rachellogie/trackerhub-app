class TrackerSearch
  def initialize
    @api_key = ENV['TRACKER_API_KEY']
  end

  def all_projects
    project_response = Faraday.new.get do |req|
      req.url 'https://www.pivotaltracker.com/services/v5/projects'
      req.headers['X-TrackerToken'] = @api_key
    end
    data = JSON.parse(project_response.body)

    @project_hash = data.map { |project| {project["id"] => project["name"]} }
  end

  def all_stories(project_id)
    stories_response = Faraday.new.get do |req|
      req.url "https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories"
      req.headers['X-TrackerToken'] = @api_key
    end
    stories= JSON.parse(stories_response.body)
    stories.map { |story| story["name"]}
  end

end