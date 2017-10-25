class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def show
		@event = Event.find_by(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@user = current_user
		@event = @user.created_events.build(event_params)
		if @event.save
			flash[:success] = "Event created"
			redirect_to @user
		else
			flash.now[:error] = "#{@event.errors.messages}"
			render 'new'
		end
	end

	private

		def event_params
			params.require(:event).permit(:title, :date, :location, :description)
		end
end
