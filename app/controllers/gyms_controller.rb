class GymsController < ApplicationController

    def index
        gym = Gym.all
        render json: gym
    end

    def show
        gym = Gym.find_by(id: params[:id])
        if gym
            render json: gym
        else
            render json: { errors: "Gym not found" }, status: :not_found
        end
    end

    def destroy
        gym = Gym.find_by(id: params[:id])
        if gym
            gym.destroy
            head :no_content
        else
            render json: { errors: "Gym not found"}, status: :not_found
        end
    end
    
end
