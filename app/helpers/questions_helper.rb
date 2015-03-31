module QuestionsHelper
    def li_for_question(question)
    content_tag :li, :"data-question-id" => question.id, :class => (question.complete? ? "completed" : "") do
      yield
    end
  end
end
