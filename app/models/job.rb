class Job
  include HTTParty
  base_uri 'api.indeed.com'
  PER_PAGE = 10


  def initialize()
    @options = { query: {publisher: '2824545219792791', q: 'ruby', v: '2', co: 'au', l: '2000'} }
  end

  def jobs(page = 1, per_page = PER_PAGE)
    @options[:query].merge!(start: ((page - 1) * per_page), limit: per_page)

    res = self.class.get('/ads/apisearch', @options)
    res['response']
  end

end
