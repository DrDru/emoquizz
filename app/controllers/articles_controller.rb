class ArticlesController < ApplicationController
  
  def index
  
  end
  def new
  
  end
  
  def create
    
	tmp = Integer(params[:article]['text'])
	
	if tmp > 10 
	  
	  render :template => 'welcome/greater_than_10' 
    
	else
	
      render :template => 'welcome/less_than_10'
	  
	end

  end

end
