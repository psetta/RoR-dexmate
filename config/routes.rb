Rails.application.routes.draw do
  
  root 'welcome#index'
  
  #---------------- WELCOME --------------------------------
  get 'welcome/index'
  post   '/login',   to: 'welcome#login'
  get '/logout',  to: 'welcome#destroy'

  #---------------- DASHBOARD ------------------------------
  get '/dashboard', to: 'dashboard#index'
  post '/userUpdate', to: 'dashboard#update'
  
  #---------------- CALENDAR -------------------------------
  get '/calendar', to: 'calendar#index'
  post '/calCreate', to: 'calendar#create'
  post '/deleteEvent', to: 'calendar#destroy'
  post '/editEvent', to: 'calendar#update'

  #---------------- HEALTH ---------------------------------
  get '/health', to: 'health#index'
  post '/newHealth', to: 'health#create'
  post '/dateRangeHealth', to: 'health#dataRange'
  post '/healthDelete', to: 'health#destroy'
  
  #---------------- FAQ ------------------------------------
  get '/faq', to: 'faq#index'

  #---------------- ADMIN ----------------------------------
  get '/admin', to: 'admin#index'
  post '/newUser', to: 'admin#create'
  post '/deleteUser', to: 'admin#destroy'
  post '/userAdminUpdate', to: 'admin#update'

end
