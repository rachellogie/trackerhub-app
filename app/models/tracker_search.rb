class TrackerSearch
  def initialize
    @api_key = ENV['TRACKER_API_KEY']
  end

  def all
    project_response = Faraday.new.get do |req|
      req.url 'https://www.pivotaltracker.com/services/v5/projects'
      req.headers['X-TrackerToken'] = @api_key
    end
    data = JSON.parse(project_response.body)
    data.map { |project| project["name"]}
  end


end