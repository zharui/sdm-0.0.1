class MmOrdinaryPublishersController < ApplicationController
	def index
		if params[:per_page]
			@per_page = params[:per_page]
		else
			@per_page = 10
		end
#		@mm_ordinary_publishers = MOrdinaryPublisher.paginate(page: params[:page], per_page: @per_page)
		@mm_ordinary_publishers = MOrdinaryPublisher.paginate(page: params[:page], per_page: @per_page).search(params[:search])
	end

	def show
	end

	def edit
		@publisher = MOrdinaryPublisher.find(params[:id])
	end

	def update
		@publisher = params[:id]
		redirect_to edit_mm_ordinary_publisher_path(@publisher)
	end

	def destroy
		MOrdinaryPublisher.find(params[:id]).destroy
		flash[:success] = "Publisher destroyed."
		session[:return_to] ||= request.referer	
		redirect_to session.delete(:return_to)
	end
end
