class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      flash[:notice] = "Venue was saved."
      redirect_to @venue
    else
      flash[:error] = "There was a problem saving the venue. Please try again."
      render :new
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update_attributes(venue_params)
      flash[:notice] = "Venue was updated."
      redirect_to @venue
    else
      flash[:error] = "There was an error saving the venue. Please try again."
      render :edit
    end
  end




  private

  def venue_params
    params.require(:venue).permit(:name, :body, :address, :phone, :website)
  end

end
