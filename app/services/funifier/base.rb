class Funifier::Base
  TOKEN    = "Basic #{Rails.application.credentials.dig(:funifier_token)}"
  BASE_URL = "https://service2.funifier.com"

  attr_accessor :conn, :response

  def initialize(**args)
    @conn = Faraday.new(url: BASE_URL) do |f|
      f.request :retry, {max: 1, interval: 0.05}
      f.adapter Faraday.default_adapter
    end

    post_initialize(**args)
    add_headers
  end

  private

  def get_request(url)
    self.response = conn.get do |request|
      request.url url
      request.options.timeout = 0.5
    end
    JSON.parse self.response.body
  end

  def post_request(url)
    self.response = conn.post do |request|
      request.url url
      request.body = create_body.to_json
    end
    self.response
  end

  def post_initialize(**args)
  end

  def add_headers
    conn.headers.merge!(
      {
        'Authorization'=> TOKEN,
        'Content-Type'=> "application/json"
      }
    )
  end
end
