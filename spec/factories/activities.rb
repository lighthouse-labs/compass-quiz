require 'faker'

FactoryGirl.define do
  factory :activity do
    day 2016-01-01
    title 'The activity'
    compass_install 'test'
    compass_primary_key 1234
  end
end