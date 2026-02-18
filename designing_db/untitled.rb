
/users  --> index -> get
/users/:id --> show -->get
/users/ new  --> new ---> get
/users ---> post --> het
/users/:id/edit --> edit -->get
/users/:id --> put
/users/:id --> delete


/users/:user_id/posts  --> index
/posts/:id
/users/:user_id/posts/new
/users/:user_id/posts --> crea

/posts/:id/edit

/posts/:id


resources :users do
	member do
		get :profile
		patch :activate
	end

	collection do
		get :search
		delete :bulk_delete
	end
end


bundle exec sidekiq -q critical -q mailers -q de