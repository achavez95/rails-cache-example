class ChallengesController < ApplicationController

  def show
    @challenges = Rails.cache.fetch("funifier_challenges", expires_in: 1.hour, skip_nil: true, namespace: 'funifier_challenges') do
      Funifier::Challenge.new.index
    end
  end

end
