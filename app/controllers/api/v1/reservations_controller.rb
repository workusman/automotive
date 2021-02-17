# frozen_string_literal: true

module Api
  module V1
    class ReservationsController < Api::V1::BaseController
      before_action :set_reservation, only: %i[show destroy]

      def create
        @reservation = Reservation.create!(reservation)
        render :show
      end

      def destroy
        @reservation.deleted!
        render :show
      end

      def show; end

      private

      def reservation_params
        params.require(:reservation).permit(:customer_id, :vehicle_id, :starts_at, :ends_at, :tzoffset)
      end

      def set_reservation
        @reservation = Reservation.find(params[:id])
      end
    end
  end
end
