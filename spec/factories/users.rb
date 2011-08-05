# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl::Password = 'secret'

FactoryGirl.define do
  factory :user do
    sequence :email do |i|
      "user-#{i}@example.com"
    end
    password FactoryGirl::Password
    password_confirmation FactoryGirl::Password

    factory :confirmed_user do
      after_create { |u| u.confirm! }

      factory :worker do
        role 'worker'
      end

      factory :boss do
        role 'boss'
      end
    end
  end
end
