class HomesController < ApplicationController

  def top
  end

  def about
    redirect_to home_about_path
  end

end
