class EmoquestionsController < ApplicationController

    def index
      @emoquestions = Emoquestion.all
    end

   def new
   end

   def create
     @emoquestion = Emoquestion.new(emoquestion_params)
	   @emoquestion.save
	   redirect_to @emoquestion
    end
  
   def show
     @emoquestion = Emoquestion.find(params[:id])
     
    end
   

  def check

    question_id = Integer(params[:emoquestion]['question_id']) 
    answ = params[:emoquestion]['text']

    if answ == Emoquestion.find(question_id).answer_a

      redirect_to :action => "success", id: question_id
    
   else
    
    redirect_to :action => "failure", id: question_id  
    
end

end

def success
     
    next_question_id = Integer(params[:id]) + 1
    #render :template => 'emoquestions/success' 
    redirect_to :action => "show", id: next_question_id  
end

def failure
  
  #render plain: 
  @question_id = params[:id]
  render :template => 'emoquestions/failure' 
end


  private
  def emoquestion_params
    params.require(:emoquestion).permit(:emoji, :answer_a, :answer_b, :is_correct_a, :is_correct_b)
  end

end
