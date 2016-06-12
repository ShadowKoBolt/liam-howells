class Homepage < Page
  jsonb_accessor :content,
                 how_it_works: :text
end
