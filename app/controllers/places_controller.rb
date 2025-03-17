class PlacesController < ApplicationController

  def index
    @places = Place.all
    @place = Place.new
    puts @places.inspect
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"] })
  end

  def new
  end

  def create
    @user = User.find_by({ "id" => session["user_id"] })
    if @user != nil
      @place = Place.new
      @post["user_id"] = @current_user["id"] 
      @place["name"] = params["name"]
      @place.save
    else
      flash["notice"] = "Login first."
    end
    redirect_to "/places"
  end

  def edit
    # find a Place
    @place = Place.find_by({ "id" => params["id"] })
    # render view with edit Place form
  end

  def update
    # find a Place
    @Place = Place.find_by({ "id" => params["id"] })

    # assign user-entered form data to Company's columns
    @place["name"] = params["name"]

    # save Company row
    @place.save

    # redirect user
    redirect_to "/places"
  end

  def destroy
    # find a Place
    @place = Place.find_by({ "id" => params["id"] })

    # destroy Company row
    @place.destroy

    # redirect user
    redirect_to "/places"
  end
end
