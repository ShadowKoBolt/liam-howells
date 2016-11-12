# frozen_string_literal: true
Rails.application.routes.draw do
  mount Smug::Engine => "/"

  resources :initial_questionnaires, only: [:new, :create]
  resources :user_applications, only: [:show] do
    member do
      get :health
      post :health
      get :about
      post :about
      post :submit_for_review
      get :payment
    end
  end
  resources :testimonials, only: [:index]

  get "contact", to: "contacts#new", as: "contact"
  post "contact", to: "contacts#create", as: "create_contact"

  get "blog", to: "blog_posts#index"
  get "blog-post/:id", to: "blog_posts#show", as: "blog_post"

  post "#{Smug.configuration.admin_route}/initial_questionnaires/:id/convert" => "smug/admin/initial_questionnaires#convert",
       as: "convert_admin_initial_questionnaire"
  post "#{Smug.configuration.admin_route}/user_applications/:id/approve" => "smug/admin/user_applications#approve",
       as: "approve_admin_user_application"

  get ":id" => "pages#show"

  root "pages#show", id: "home"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
