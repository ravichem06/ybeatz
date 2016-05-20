Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  root 'landing_page#index'

  get "sitemap.xml.gz" => "sitemaps#sitemap", format: :xml, as: :sitemap
  
  get 'editors/index', path: 'editors/editor-panel'
  get 'admin/index', path: '/admin-panel'

  resources :posts
  resources :topics
  resources :forums
  
  devise_for :members, controllers: { registrations: "registrations" }
  resources :members 
  
  resources :profiles

  resources :communities, path: 'post' do
    resources :comments
  end

    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'

    resources :sessions, only: [:create, :destroy]
    resource :home, only: [:show]

    
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]
  resources :subscribers, only: [:index, :create]
  match ':controller(/:action(/:id))', :via => [:get, :post]

  devise_scope :member do 
    
    match '/sessions/member', to: 'devise/sessions#create', via: :post
  end

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
