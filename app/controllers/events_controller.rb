class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event was saved."
      redirect_to @event
    else
      flash[:error] = "There was an error saving the event. Please try again."
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:notice] = "Event was updated"
      redirect_to @event
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end


  private

  def event_params
    params.require(:event).permit(:title, :body, :price)
  end

end
