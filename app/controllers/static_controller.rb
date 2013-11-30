class StaticController < ApplicationController
  def about
  	@about = Static.find(1)
  end

  def contact
  	@contact = Static.find(2)
  end
end