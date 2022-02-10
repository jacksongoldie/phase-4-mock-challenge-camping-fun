class CampersController < ApplicationController

    def index
        campers = Camper.all 
        render json: campers, each_serializer: CamperActivitySerializer
    end

    def show
        render json: camper
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def camper
        Camper.find(params[:id])
    end

    def camper_params
        params.permit(:name, :age)
    end
end
