# frozen_string_literal: true
class ContactInfo < Page
  jsonb_accessor :content,
                 introduction: :text
end
