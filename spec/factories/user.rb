FactoryGirl.define do
    factory :user do
      email 'youro@gmail.com'
      first_name 'Ben'
      last_name  'Wang'
      password  '123123123'
      password_confirmation '123123123'
    end
    factory :user2 do
      email 'your2@gmail.com'
      first_name 'Ben2'
      last_name  'Wang2'
      password  '123123123'
      password_confirmation '123123123'
    end
end