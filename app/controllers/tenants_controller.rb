class TenantsController < ApplicationController

    def index
        tenants = Tenant.all 
        render json: tenants
    end 

    def create
        new_tenant = Tenant.create(tenant_params)
        render json: new_tenant, status: :created
    end

    def update
        tenant = find_tenant
        tenant.update(tenant_params)
        render json: tenant
    end 

    def destroy
        tenant = find_tenant
        tenant.destroy
    end


    private
    def tenant_params
        params.permit(:name, :age)
    end 
    def find_tenant
        Tenant.find_by(id: params[:id])
    end
end
 
