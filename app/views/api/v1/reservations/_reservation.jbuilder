# frozen_string_literal: true

json.extract! reservation, :id, :starts_at, :ends_at
json.customer do
  json.id reservation.customer.id
  json.name reservation.customer.name
  json.email reservation.customer.email
  json.phone_number reservation.customer.phone_number
end
json.vehicle do
  json.id reservation.vehicle.id
  json.make reservation.vehicle.make
  json.model reservation.vehicle.model
  json.year reservation.vehicle.year
  json.name reservation.vehicle.name
end
