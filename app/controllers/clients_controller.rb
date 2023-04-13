class ClientsController < ApplicationController
    
    def index
        client = Client.all
        render json: client
    end
    
    def show
        client = client.find_by(id: params[:id])
        if client
            render json: client
        else
            render json: { errors: "Client not found" }, status: :not_found
        end
    end

    def create
        client = Client.new(client_params)
        if client.valid?
          client.save
          render json: client, status: :created
        else
          render json: { errors: client.errors }, status: :unprocessable_entity
        end
    end
end
