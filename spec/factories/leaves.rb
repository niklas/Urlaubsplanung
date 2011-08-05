# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :leave do
    first_day "2011-08-05"
    duration 1
    comment "Tahiti"
    worker

    factory :leave_request do
      state "requested"
    end

    factory :confirmed_leave do
      state "confirmed"
    end

    factory :taken_leave do
      state "taken"
    end
  end
end
