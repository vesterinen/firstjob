class QuestionsController < ApplicationController
  def create  
    @list = List.find(params[:list_id])
    @question = @list.questions.build(question_params)

    @question.save
    render :layout => false
  end

  def update
    @list = List.find(params[:list_id])
    @question = @list.questions.find(params[:id])
    
    @question.update(question_params)
    
    render :nothing => true, :status => :ok
  end

  private
    def question_params
      params.require(:question).permit(:content, :status)
    end
end
