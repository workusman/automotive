FactoryBot.define do
  factory :customer do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    sequence :name do |n|
      "person-#{n}"
    end
    sequence :phone_number do |n|
      "1234567-#{n}"
    end
  end
end
