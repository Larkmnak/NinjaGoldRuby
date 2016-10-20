class NinjaController < ApplicationController
	def home
		session[:gold] = 0 if session[:gold] == nil
		session[:gold_history] = [] if session[:gold_history] == nil
		@gold = session[:gold]
	end
	def gold
		temp = session[:gold]
		amount = rand(10..20) if params[:search] == "farm"
		amount = rand(5..10) if params[:search] == "cave"
		amount = rand(2..5) if params[:search] == "house"
		amount = (rand(0..100) - 50) if params[:search] == "casino"
		session[:gold] += amount
		change = "gained" if session[:gold] - temp > 0
		change = "lost" if session[:gold] - temp < 0
 		session[:gold_history].push("You head into the #{ params[:search] } and #{ change } #{ amount } gold")
		puts session[:gold_history]
		redirect_to "/"
	end
end
