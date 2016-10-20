Rails.application.routes.draw do
	root "ninja#home"
	post "ninja/gold"
end
