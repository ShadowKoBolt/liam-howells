# frozen_string_literal: true
class Homepage < Page
  jsonb_accessor :content,
                 how_it_works: :text,
                 nutrition_summary: :string,
                 nutrition_details: :text,
                 training_summary: :string,
                 training_details: :text,
                 support_summary: :string,
                 support_details: :text,
                 motivation_summary: :string,
                 motivation_details: :text,
                 education_summary: :string,
                 education_details: :text,
                 basic_package_overview: :text,
                 standard_package_overview: :text,
                 premium_package_overview: :text,
                 about_heading: :string,
                 about: :text
end
