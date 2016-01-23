require 'spec_helper'

describe 'activities' do

  describe '#index' do
    it 'should display all the existed activities'
    it 'display no activities message when there is no existed activities'
    it 'should have a add new activities function'
    it 'should show the new added activities on the list after add success'
  end

  describe '#create' do
    it 'could save a new activities'
    it 'failed adding new activities if it can not be saved'
  end

  # describe '#show' do
  #
  # end

  describe '#update' do
    it 'could be updated if this activities belong to user'
    it 'could not be updated if this activities does not belong to user'
  end

  describe '#destroy' do
    it 'could be deleted if this activities belong to user'
    it 'could not be deleted if this activities does not belong to user'
  end

end