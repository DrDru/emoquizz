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

    #try
     # {
          @emoquestion = Emoquestion.find(params[:id])
      #}
      #catch(Exeption)
      #{
       #check that it is not the biggest id
      #}
      #finally
      #{
      #this_code_is_always_executed();
      # something went wrong
      #}



     @emoquestion = Emoquestion.find(params[:id])
  end
   

  def check
    #render plain: params[:emoquestion]
    question_id = Integer(params[:emoquestion]['question_id']) 
    answ =  Integer(params[:emoquestion]['answer'])

    answer = Emoquestion.find(question_id).is_correct

    #render plain: answ == answer

    if answ == answer

      redirect_to :action => "success", id: question_id
  
    else
    
    redirect_to :action => "failure", id: question_id, true_answer: answer
end

end

def success
     
    next_question_id = Integer(params[:id]) + 1
    #render plain: next_question_id 
    #render :template => 'emoquestions/success' 
    redirect_to :action => "show", id: next_question_id
end

def failure
  
  #render plain: 僻 # fasl
  @question_id = params[:id]
  #render plain: @question_id 
  # true_answer
  redirect_to :action => "failed", id: params[:id], true_answer: params[:answer]  ## &#128575; Oh no Sentence is false ! Next # 「猫は黒い」は間違っています
  
end

  def failed

    answer = Emoquestion.find(params[:id]).question

    is_correct = Emoquestion.find(params[:id]).is_correct

    if is_correct == 1

      params['message'] =  answer + ' is correct'

    else 
    
      params['message'] =  answer + ' is not correct'

    end
    
    #render plain: params

  end


  private
  def emoquestion_params
    params.require(:emoquestion).permit(:question, :is_correct)
  end

end
