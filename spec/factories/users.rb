require 'faker'

FactoryGirl.define do
  factory :user do
    name 'admin'
    email 'admin@example.com'
    password 'admin'
  end
end