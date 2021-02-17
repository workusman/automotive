FactoryBot.define do
  factory :vehicle do
    make {"Honda"}
    model {"City"}
    year {2019}
    sequence :name do |n|
      "test_#{n}"
    end
  end
end
