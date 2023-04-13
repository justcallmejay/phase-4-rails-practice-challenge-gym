class MembershipsController < ApplicationController

    def index
        memberships = Membership.all.includes(:client, :gym)
        render json: memberships, include: { client: {}, gym: {} }, status: :ok
    end

    def create
        membership = Membership.create(member_params)
        if membership.valid?
            render json: membership
        else
            render json: { error: "Nah name"}, status: :unprocessable_entity
        end
    end

    private

    def member_params
        params.permit(:gym_id, :client_id, :charge)
    end

end
