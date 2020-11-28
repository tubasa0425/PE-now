class HomesController < ApplicationController

  def top
    @infolists = Infolist.all
    @infolist = Infolist.new
    if Rails.env.development?
      @random = Infolist.order("RANDOM()").limit(5)
    else
      @random = Infolist.order("RAND()").limit(5)
    end


  end

  def about
  end

  def qa
  end

end
