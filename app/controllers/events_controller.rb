class EventsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @events = @category.events
  end

  def show
    @category = Category.find(params[:category_id])
    @event = Event.find(params[:id])
  end

  def new
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @event = Event.new
  end

  def create
    @category = Category.find(params[:category_id])
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event was saved."
      redirect_to [@category, @event]
    else
      flash[:error] = "There was an error saving the event. Please try again."
      render :new
    end
  end

  def edit
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @event = Event.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:notice] = "Event was updated"
      redirect_to [@category, @event]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end


  private

  def event_params
    params.require(:event).permit(:title, :body, :price, :category_ids)
  end

end
