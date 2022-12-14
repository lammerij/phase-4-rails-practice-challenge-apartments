class LeasesController < ApplicationController

    def create
        new_lease = Lease.create(lease_params)
        render json: new_lease, status: :created
    end 
    
    def destroy
        lease = find_lease
        lease.destroy
    end

    

    private

    def lease_params
        params.permit(:rent)
    end

    def find_lease
        Lease.find_by(id: params[:id])
    end 
end
