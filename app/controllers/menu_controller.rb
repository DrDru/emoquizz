class MenuController < ApplicationController
  def index

  	render 'index.html'
  end

  def intro
  	render 'intro.html'
  end

  def contact
  	render 'contact.html'
  end

  def about
  	render 'about.html'
  end

end
