# frozen_string_literal: true

module Api
  module V1
    class VehiclesController < Api::V1::BaseController
      def index
        @vehicles = Vehicle.all
      end

      def create
        @vehicle = Vehicle.create!(vehicle_params)
        render :show
      end

      private

      def vehicle_params
        params.require(:vehicle).permit(:make, :model, :year, :name)
      end
    end
  end
end
