Rails.application.routes.draw do
	resources :theories

	put "/theories/:id/upvote", to: "theories#upvote"

	put "/theories/:id/downvote", to: "theories#downvote"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
