class ApartmentsController < ApplicationController

    def index
        apartments = Apartment.all 
        render json: apartments
    end 

    def create
        new_apartment = Apartment.create(apartment_params)
        render json: new_apartment, status: :created
    end

    def update
        apartment = find_apartment
        apartment.update(apartment_params)
        render json: apartment
    end 

    def destroy
        apartment = find_apartment
        apartment.destroy
    end 

    private
    def apartment_params
        params.permit(:number)
    end 
    def find_apartment
        Apartment.find_by(id: params[:id])
    end
end
