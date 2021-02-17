FactoryBot.define do
  factory :reservation do
    starts_at {Time.now}
    ends_at {Time.now + 1.day}
    customer {nil}
    vehicle {nil}
  end
end
