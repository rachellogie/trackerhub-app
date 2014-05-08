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

  def all_tracker_comments(project_id)
    stories_response = Faraday.new.get do |req|
      req.url "https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories"
      req.headers['X-TrackerToken'] = @api_key
    end
    stories= JSON.parse(stories_response.body)
    id_array = stories.map { |story| story["id"]}
    comments_arr = []
    id_array.each do |story_id|
      comments_response = Faraday.new.get do |req|
        req.url "https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories/#{story_id}/comments"
        req.headers['X-TrackerToken'] = @api_key
      end
      comments = JSON.parse(comments_response.body)
     comments_arr << comments.map { |comment| comment["text"]}
    end
    comments_arr.flatten
  end

end