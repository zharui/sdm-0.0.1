class MOrdinaryPublishersController < ApplicationController
	def index
		if params[:per_page]
			@per_page = params[:per_page]
		else
			@per_page = 10
		end
#		@m_ordinary_publishers = MOrdinaryPublisher.paginate(page: params[:page], per_page: @per_page)
		@m_ordinary_publishers = MOrdinaryPublisher.paginate(page: params[:page], per_page: @per_page).search(params[:search_type], params[:search])
	end

	def new
		@publisher = MOrdinaryPublisher.new
	end

	def show
		@publisher = MOrdinaryPublisher.find(params[:id])
	end

	def edit
		@publisher = MOrdinaryPublisher.find(params[:id])
	end

	def create
		@to_be_insert = { name: params[:m_ordinary_publisher][:name], 
										 url: params[:m_ordinary_publisher][:url],
										 state_id: MState.find_by(name: params[:m_ordinary_publisher][:state_id]).id,
										 created_user_id: User.find_by(name: current_user.name).id, 
										 modified_user_id: User.find_by(name: current_user.name).id }
		@publisher = MOrdinaryPublisher.new(@to_be_insert)
		if @publisher.save
			flash[:success] = "Create publisher success!"
			redirect_to m_ordinary_publishers_path
		else
			render 'new'
		end
	end	

	def update
		@publisher = MOrdinaryPublisher.find(params[:id])	

		MOrdinaryPublisher.update(params[:id], 
										name: params[:m_ordinary_publisher][:name],
										url: params[:m_ordinary_publisher][:url],
										state_id: MState.find_by(name: params[:m_ordinary_publisher][:state_id]).id,
										modified_user_id: User.find_by(name: current_user.name).id )

#		if @publisher.update_attributes(publisher_params)	
			flash[:success] = "Profile updated"
			redirect_to m_ordinary_publishers_path
#		else
#			redirect_to root_path
#		end
	end

	def destroy
		MOrdinaryPublisher.find(params[:id]).destroy
		flash[:success] = "Publisher destroyed."
		session[:return_to] ||= request.referer	
		redirect_to session.delete(:return_to)
	end

	private

	def publisher_params
		params.require(:m_ordinary_publisher).permit(:name, :url, :state_id)
	end

end
