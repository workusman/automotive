class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :vehicle
  validates_presence_of :starts_at, :ends_at
  validate :time_validation
  scope :overlapping, ->(starts_at, ends_at) { where('(starts_at, ends_at) OVERLAPS (?, ?)', starts_at, ends_at) }

  private

  def time_validation
    errors.add(:base , 'End Time must me greater than Start Time') if (starts_at >= ends_at)
  end
end
