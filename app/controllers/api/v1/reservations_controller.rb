# frozen_string_literal: true

module Api
  module V1
    class ReservationsController < Api::V1::BaseController
      before_action :set_reservation, only: %i[show destroy]
      before_action :set_vehicle, only: %i[create]

      def create
        @reservation = Reservation.new(reservation_params)
        if @vehicle.reservations.overlapping(params[:reservation][:starts_at], params[:reservation][:ends_at]).empty?
          @reservation.save!
          render :show
        else
          raise StandardError, 'This vehicle is booked for the given time slot'
        end
      end

      def destroy
        @reservation.destroy!
       render json: "Reservation destroyed", status: 200
      end

      def show; end

      private

      def reservation_params
        params.require(:reservation).permit(:customer_id, :vehicle_id, :starts_at, :ends_at, :tzoffset)
      end

      def set_reservation
        @reservation = Reservation.find(params[:id])
      end

      def set_vehicle
        @vehicle = Vehicle.find(params[:reservation][:vehicle_id])
      end
    end
  end
end
