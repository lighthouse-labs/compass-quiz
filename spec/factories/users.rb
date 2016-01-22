require 'faker'

FactoryGirl.define do
  factory :user do |u|
    u.name 'admin'
    u.email 'admin@example.com'
    u.password 'admin'
  end
end