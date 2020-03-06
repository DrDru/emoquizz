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

    if params[:score] == nil

       params[:score] = 0

    end  

    begin
        
        @emoquestion = Emoquestion.find(params[:id])
        tmp = @emoquestion.question.split(' ')

        create_link = ->(x, y) { '<a href="../definitions/' + x + '"' + ' class="dictionary_links"' + '>' + y + '</a>' }

        tmp = tmp.map { |elem| 

          if elem[0..1] == '&&'

                  elem[2..-1]

          elsif  elem[0..1]  == '$$'

               elem = elem.split('_')

               create_link.call(elem[1], elem[0][2..-1])

           


              else create_link.call(elem, elem)

          end  

        }

        @emoquestion.question =  tmp.join("") 
        #<a href="https://www.w3schools.com/html/">Visit our HTML tutorial</a> 

        #render plain: @emoquestion.question
    
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

    question_id = Integer(params[:emoquestion]['question_id']) 
    question = params[:emoquestion]['question_body']
    answ =  Integer(params[:emoquestion]['answer'])
    answer = Emoquestion.find(question_id).is_correct
    #render plain: params
    if answ == answer

      redirect_to :action => "success", id: question_id, score: params[:emoquestion]['score']

    else
    
    redirect_to :action => "failure", id: question_id, true_answer: answer, score: params[:emoquestion]['score'], question_body: question
  end
end



def success
     
    next_question_id = Integer(params[:id]) + 1

    redirect_to :action => "show", id: next_question_id, score: params[:score]

end

def failure
  
  next_question_id = Integer(params[:id]) + 1
  new_score = Integer(params[:score]) + 1
  #render plain: params[:question_body]

  redirect_to :action => "failed", id: Integer(params[:id]), next_question_id: next_question_id, true_answer: params[:answer], score: new_score, question_body: params[:question_body]  

end

def failed

  answer = Emoquestion.find(params[:id]).question

  
  is_correct = Emoquestion.find(params[:id]).is_correct

  tmp = ''

  params[:score] = [Integer(params[:score]), 20].min
    
  (1..Integer(params[:score])).each do |i|  tmp += '😿' end

  params['cats'] = tmp.encode("UTF-8")

  #render plain: params[:question_body]

  if is_correct == 1

    params['message'] =  "[" + params[:question_body]  + "]" + ' is correct'

  else 
    
    params['message'] =  "[ "+ params[:question_body] + "]" + ' is not correct'

  end
    
end


private
 def emoquestion_params
   params.require(:emoquestion).permit(:question, :is_correct)
 end

end
