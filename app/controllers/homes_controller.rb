class HomesController < ApplicationController

  def top
    @infolists = Infolist.all
    @infolist = Infolist.new
    @random = Infolist.order("RANDOM()").limit(5)


  end

  def about
  end

  def qa
  end

end
