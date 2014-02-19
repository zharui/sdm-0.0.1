class MOrdinaryChannelsController < ApplicationController
	def index
		if params[:per_page]
			@per_page = params[:per_page]
		else
			@per_page = 10
		end
		gon.publisher_id = params[:publisher_id]
#		if @id == nil
#			@id = 302
#		end
#		@m_ordinary_channels = MOrdinaryChannle.paginate(page: params[:page], per_page: @per_page)
#		@m_ordinary_channels = MOrdinaryChannel.paginate(page: params[:page], per_page: @per_page).search(params[:search])
		@publisher = MOrdinaryPublisher.find(params[:publisher_id])
		@m_ordinary_channels = @publisher.m_ordinary_channels.paginate(page: params[:page], per_page: @per_page).search(params[:search_type], params[:search])
#		redirect_to m_ordinary_channels_path, id: @id
	end

	def new
		@channel = MOrdinaryChannel.new
	end

	def show
		@channel = MOrdinaryChannel.find(params[:id])
	end

	def edit
		@channel = MOrdinaryChannel.find(params[:id])
	end

	def create
		@to_be_insert = { name: params[:m_ordinary_channel][:name], 
										 url: params[:m_ordinary_channel][:url],
										 state_id: MState.find_by(name: params[:m_ordinary_channel][:state_id]).id,
										 created_user_id: User.find_by(name: current_user.name).id, 
										 modified_user_id: User.find_by(name: current_user.name).id,
										 m_ordinary_publisher_id: params[:publisher_id].to_i }
		@channel = MOrdinaryChannel.new(@to_be_insert)
		if @channel.save
			flash[:success] = "Create channel success!"
			redirect_to action: :index, publisher_id: params[:publisher_id]
#			redirect_to action: "new", id: params[:id]
		else
			render action: :new, publisher_id: params[:publisher_id]
#			render new_m_ordinary_channel_path(publisher_id: params[:publisher_id])
		end
	end	

	def update
		@channel = MOrdinaryChannel.find(params[:id])	

		MOrdinaryChannel.update(params[:id], 
										name: params[:m_ordinary_channel][:name],
										url: params[:m_ordinary_channel][:url],
										state_id: MState.find_by(name: params[:m_ordinary_channel][:state_id]).id,
										modified_user_id: User.find_by(name: current_user.name).id )

#		if @publisher.update_attributes(publisher_params)	
			flash[:success] = "Channel updated"
			redirect_to action: :index, publisher_id: params[:publisher_id]
#		else
#			redirect_to root_path
#		end
	end

	def destroy
		MOrdinaryChannel.find(params[:id]).destroy
		flash[:success] = "Channel destroyed."
		session[:return_to] ||= request.referer	
		redirect_to session.delete(:return_to)
	end

	private

	def publisher_params
		params.require(:m_ordinary_channel).permit(:name, :url, :state_id)
	end


end
