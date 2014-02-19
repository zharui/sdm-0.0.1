class MOrdinaryPositionsController < ApplicationController
	def index
		if params[:per_page]
			@per_page = params[:per_page]
		else
			@per_page = 10
		end
		gon.publisher_id = params[:publisher_id]
		gon.channel_id = params[:channel_id]
#		if @id == nil
#			@id = 302
#		end
#		@m_ordinary_channels = MOrdinaryChannle.paginate(page: params[:page], per_page: @per_page)
#		@m_ordinary_channels = MOrdinaryChannel.paginate(page: params[:page], per_page: @per_page).search(params[:search])
		@channel = MOrdinaryChannel.find(params[:channel_id])
		@m_ordinary_positions = @channel.m_ordinary_positions.paginate(page: params[:page], per_page: @per_page).search(params[:search_type], params[:search])
#		redirect_to m_ordinary_channels_path, id: @id
	end

	def new
		@position = MOrdinaryPosition.new
	end

	def show
		@position = MOrdinaryPosition.find(params[:id])
	end

	def edit
		@position = MOrdinaryPosition.find(params[:id])
	end

	def create
		@to_be_insert = { name: params[:m_ordinary_position][:name], 
										 url: params[:m_ordinary_position][:url],
										 state_id: MState.find_by(name: params[:m_ordinary_position][:state_id]).id,
										 material_id: MMaterial.find_by(name: params[:m_ordinary_position][:material_id]).id,
										 dimension_id: MDimension.find_by(name: params[:m_ordinary_position][:dimension_id]).id,
										 layout_id: MLayout.find_by(name: params[:m_ordinary_position][:layout_id]).id,
										 format_id: MFormat.find_by(name: params[:m_ordinary_position][:format_id]).id,
										 size: params[:m_ordinary_position][:size],
										 serving_id: MServingType.find_by(name: params[:m_ordinary_position][:serving_id]).id,
										 payment_id: MPaymentType.find_by(name: params[:m_ordinary_position][:payment_id]).id,
										 created_user_id: User.find_by(name: current_user.name).id, 
										 modified_user_id: User.find_by(name: current_user.name).id,
										 m_ordinary_publisher_id: params[:publisher_id].to_i, 
										 m_ordinary_channel_id: params[:channel_id].to_i }
		@position = MOrdinaryPosition.new(@to_be_insert)
		if @position.save
			flash[:success] = "Create position success!"
			redirect_to m_ordinary_positions_path(publisher_id: params[:publisher_id], channel_id: params[:channel_id])
#			redirect_to action: :index, publisher_id: params[:publisher_id]
#			redirect_to action: "new", id: params[:id]
		else
#			render new_m_ordinary_position_path(publisher_id: params[:publisher_id], channel_id: params[:channel_id])
			render action: :new, publisher_id: params[:publisher_id], channel_id: params[:channel_id]
		end
	end	

	def update
		@position = MOrdinaryPosition.find(params[:id])	

		MOrdinaryPosition.update(params[:id], 
										name: params[:m_ordinary_position][:name],
										url: params[:m_ordinary_position][:url],
										state_id: MState.find_by(name: params[:m_ordinary_position][:state_id]).id,
										material_id: MMaterial.find_by(name: params[:m_ordinary_position][:material_id]).id,
										dimension_id: MDimension.find_by(name: params[:m_ordinary_position][:dimension_id]).id,
										layout_id: MLayout.find_by(name: params[:m_ordinary_position][:layout_id]).id,
										format_id: MFormat.find_by(name: params[:m_ordinary_position][:format_id]).id,
										size: params[:m_ordinary_position][:size],
										serving_id: MServingType.find_by(name: params[:m_ordinary_position][:serving_id]).id,
										payment_id: MPaymentType.find_by(name: params[:m_ordinary_position][:payment_id]).id,
										state_id: MState.find_by(name: params[:m_ordinary_position][:state_id]).id,
										modified_user_id: User.find_by(name: current_user.name).id )

#		if @publisher.update_attributes(publisher_params)	
			flash[:success] = "Position updated"
			redirect_to m_ordinary_positions_path(publisher_id: params[:publisher_id], channel_id: params[:channel_id])
#			redirect_to action: :index, publisher_id: params[:publisher_id]
#		else
#			redirect_to root_path
#		end
	end

	def destroy
		MOrdinaryPosition.find(params[:id]).destroy
		flash[:success] = "Position destroyed."
		session[:return_to] ||= request.referer	
		redirect_to session.delete(:return_to)
	end

	private

	def position_params
		params.require(:m_ordinary_position).permit(:name, :url, :state_id)
	end


end
