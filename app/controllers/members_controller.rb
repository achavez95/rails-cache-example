class MembersController < ApplicationController

  def show
    @members = Member.all
  end

end
