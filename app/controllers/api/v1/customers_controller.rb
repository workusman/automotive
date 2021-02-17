# frozen_string_literal: true

module Api
  module V1
    class CustomersController < Api::V1::BaseController
      def index
        @customers = Customer.all
      end

      def create
        @customer = Customer.create!(customer_params)
        render :show
      end

      private

      def customer_params
        params.require(:customer).permit(:name, :email, :phone_number)
      end
    end
  end
end
