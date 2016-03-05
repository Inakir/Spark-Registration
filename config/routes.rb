Rails.application.routes.draw do
  
  get 'join_team/index'
  
  post 'join_team/joining_team'
  post 'myform' => 'join_team#parse_comments'

  get 'registration_complete/index'

  get 'payment/marketplace'

  get 'payment/index'
  post 'checkpay' => 'payment#checkpay'
  get 'consent_forms/index'

  resources :student_users
  root 'registration_home#index'
  get 'students/new'

  #get 'admins/new' => 'admins#new'
  #put 'admins/edit' => 'admins#update'
  #patch 'admins/edit' => 'admins#update'

  get 'admins/see_info'


  post 'admins/mark_paid' => 'admins#mark_paid'
  post 'admins/send_email' => 'admins#send_email'

  resources :admins do
	member do
	  put 'changelogin' => 'admins#changelogin'
          patch 'changelogin' => 'admins#changelogin'
	  get 'changelogin' => 'admins#editlogin'
	  put 'changepassword' => 'admins#changepassword'
	  patch 'changepassword' => 'admins#changepassword'
	  get 'changepassword' => 'admins#editpassword'
	  #post 'changelogin' => 'admins#editlogin'
	end
  end
  #get 'changeadminlogin' => 'admins#editlogin'
  #put 'changeadminlogin/:id' => 'admins#changelogin'
  #patch 'changeadminlogin/:id' => 'admins#changelogin'

  get 'sessions/admin_new'
  get 'admin/log_out' => 'sessions#log_out'


  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'admin_login' => 'admins#new'
  post 'admin_login' => 'admins#create'
  delete 'admin_logout' => 'admins#destroy'

  get 'advisor/create_team' => 'advisor#create_team'
  get 'advisor/see_team'

  get 'advisor/team'

  get 'advisor/info'

  get 'sessions/new'

  resources :advisor_users
  get 'advisor/index'
  
  #get 'advisor_user/export_csv' => 'advisor_user#export_csv'

  get 'high/index'

  get 'middle/index'

  get 'elementary/index'

  get 'registration_home/index'
  
  

  resources :posts
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
    
  #  root 'posts#index'
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
