class Funifier::Challenge < Funifier::Base

  def post_initialize(challenge_id: nil, challenge_name: nil)
    @challenge_id = challenge_id
    @challenge_name = challenge_name
  end

  def index
    get_request '/v3/challenge'
    raise Faraday::TimeoutError
  end

  def get
    get_request "/v3/challenge/#{@challenge_id}"
  end

  def get_achieved_by_user(user:)
    email = CGI.escape(user.email)
    get_request "/v3/achievement?player=#{email}&type=1&orderby=time&reverse=true&item=#{@challenge_id}"
  end

  private

  def create_body
    {
      challenge: @challenge_name,
    }
  end

end
