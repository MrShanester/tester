class ContactsController < ApplicationController

  def index
    contact = Contact.all 
    render json: contact.as_json
  end

  def create
    results = Geocoder.search(params[:adress])
    lon = results[0].data["lon"]
    lat = results[0].data["lat"]
    contact = Contact.new(name: params[:name], lat: lat, lon: lon)

    render json: contact.as_json if contact.save
  end

  def test
    render json: Geocoder.search("491 4th Ave, Chester, CA, USA")[0].data["lat"].as_json
  end
end
