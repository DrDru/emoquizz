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

    #render plain: params.inspect

    if params[:score] == nil

       params[:score] = 0


    end  

    begin
      
          @emoquestion = Emoquestion.find(params[:id])
    
    end   

    rescue

    begin


    if Integer(params[:id]) == Emoquestion.last.id + 1

              redirect_to :action => "index"


      
    else Integer(params[:id]) > Emoquestion.last.id + 1

        render plain: 'this ID is way too high' 

    end

   rescue
          
          render plain: 'something went wrong' 

    end

    end    
      
      
   

  def check
    #render plain: params.inspect

    question_id = Integer(params[:emoquestion]['question_id']) 
    answ =  Integer(params[:emoquestion]['answer'])

    answer = Emoquestion.find(question_id).is_correct

    

    if answ == answer

      redirect_to :action => "success", id: question_id, score: params[:emoquestion]['score']

    else
    
    redirect_to :action => "failure", id: question_id, true_answer: answer, score: params[:emoquestion]['score']
end

end

def success
    
    #render plain: params.inspect 
    next_question_id = Integer(params[:id]) + 1
    #render plain: next_question_id 
    #render :template => 'emoquestions/success' 
    redirect_to :action => "show", id: next_question_id, score: params[:score]
end

def failure
  
  #render plain: 僻 # fasl
  next_question_id = Integer(params[:id]) + 1
  #render plain: params[:score]
  # true_answe
  new_score = Integer(params[:score]) + 1

  #render plain: new_score
  redirect_to :action => "failed", id: Integer(params[:id]), next_question_id: next_question_id, true_answer: params[:answer], score: new_score  ## &#128575; Oh no Sentence is false ! Next # 「猫は黒い」は間違っています
  
end

  def failed

    answer = Emoquestion.find(params[:id]).question

    is_correct = Emoquestion.find(params[:id]).is_correct


    tmp = ''



    params[:score] = [Integer(params[:score]), 20].min
    
    (1..Integer(params[:score])).each do |i|  tmp += '😿' end

   params['cats'] = tmp.encode("UTF-8")

    if is_correct == 1

      params['message'] =  "'" + answer + "'" + ' is correct'

    else 
    
      params['message'] =  "'"+ answer + "'" + ' is not correct'

    end
    
  end


  private
  def emoquestion_params
    params.require(:emoquestion).permit(:question, :is_correct)
  end

end
