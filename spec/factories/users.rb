# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
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
