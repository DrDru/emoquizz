class StoriesController < ApplicationController
  
  def show
  	#render plain: params
  	render  'stories/' + params[:id]
  end

  def intro
      render 'intro'
  end
end
