Rails.application.routes.draw do
  
  get 'join_team/index'
  
  post 'join_team/joining_team'
  post 'myform' => 'join_team#parse_comments'

  get 'registration_complete/index'

  get 'payment/marketplace'

  get 'payment/index'
  post 'checkpay' => 'payment#checkpay'
  get 'consent_forms/index'
  get 'student_users/generate' => 'student_users#generate'
  
  resources :student_users
  root 'registration_home#index'
  get 'students/new'

  #get 'admins/new' => 'admins#new'
  #put 'admins/edit' => 'admins#update'
  #patch 'admins/edit' => 'admins#update'
  
   #Dealing w/ student Logout###########################################3
  get 'students/log_out' => 'sessions#log_out_students'
  get 'students/log_out_students' => 'sessions#log_out_students'
#######################################################################


  get 'admins/super_admin' => 'admins#super_admin'
  get 'admins/see_info'
  get 'admins/home' => 'admins#home'
  get 'admins/index'
  get 'admins/email_page' => 'admins#email_page'

  post 'admins/email_unpaid' => 'admins#email_unpaid'
  post 'admins/email_paid' => 'admins#email_paid'
  post 'admins/send_all' => 'admins#send_all'
  post 'admins/send_stud_email' => 'admins#send_stud_email'
  post 'admins/admin_email' => 'admins#admin_email'
   post 'admins/admin_email_2' => 'admins#admin_email_2'
  post 'admins/edit_email' => 'admins#edit_email'
  post 'admins/mark_paid' => 'admins#mark_paid'
  post 'admins/mark_unpaid' => 'admins#mark_unpaid'
  post 'admins/send_email' => 'admins#send_email'
  post 'admins/unpaid_email_group' => 'admins#unpaid_email_group'
  post 'admins/email_unpaid_stud' => 'admins#email_unpaid_stud'
 #post 'admins/stud_email_group' => 'admins#stud_email_group'
 #post 'admins/send_all_stud_email' => 'admins/send_all_stud_email'

  post 'admins/email_advisors' => 'admins#email_advisors'
  post 'admins/email_all' => 'admins#email_all'
  resources :admins do
	member do
	  put 'changelogin' => 'admins#changelogin'
          patch 'changelogin' => 'admins#changelogin'
	  get 'changelogin' => 'admins#editlogin'
	  put 'changepassword' => 'admins#changepassword'
	  patch 'changepassword' => 'admins#changepassword'
	  get 'changepassword' => 'admins#editpassword'
	  #############################
	   put 'update_info' => 'admins#update'
          patch 'update_info' => 'admins#update'
	  get 'update_info' => 'admins#update_info'
	  #############3
	  #post 'changelogin' => 'admins#editlogin'
	   put 'edit_urls' => 'admins#edit_urls'
          patch 'edit_urls' => 'admins#change_urls'
	  get 'edit_urls' => 'admins#edit_urls'
	  
	end
  end

  #get 'changeadminlogin' => 'admins#editlogin'
  #put 'changeadminlogin/:id' => 'admins#changelogin'
  #patch 'changeadminlogin/:id' => 'admins#changelogin'

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
  
  get 'application/registration_login'

  resources :advisor_users
  get 'advisor/index'
  
  #get 'advisor_user/export_csv' => 'advisor_user#export_csv'
  
  get 'student_users/index'
  
  
  
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
