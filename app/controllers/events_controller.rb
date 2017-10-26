class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def show
		@event = Event.find_by(id: params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@user = current_user
		@event = @user.created_events.build(event_params)
		if @event.save
			@event.attendees << @user
			flash[:success] = "Event created"
			redirect_to @user
		else
			flash.now[:error] = "#{@event.errors.messages}"
			render 'new'
		end
	end

	def attend
		Event.find_by(id: params[:id]).attendees << current_user
		redirect_to current_user 
	end

	private

		def event_params
			params.require(:event).permit(:title, :date, :location, :description)
		end
end
