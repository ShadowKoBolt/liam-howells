class InitialQuestionnairePage < Page
  jsonb_accessor :content,
                 intro_content: :text,
                 left_content: :text
end
