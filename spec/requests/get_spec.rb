require 'rails_helper'
require 'pry'
describe 'Get request ',:type => :request, :focus => true  do
  before :each do
    @user = FactoryGirl.create(:user)
    visit '/'
    fill_in 'email', :with => 'admin@example.com'
    fill_in 'password', :with => 'admin'
    click_button "Sign In"
  end
  describe 'session' do
    it 'should get 200 status code after login' do
      visit '/session/new'
      expect(page.status_code).to eq(200)
    end
  end

  describe 'home page' do
    it 'shoul get 200 status code in homepage' do
      visit '/'
      expect(page.status_code).to eq(200)
    end
  end

  describe 'activities' do
    it 'should get 200 status code in activities index' do
      click_link('Activities')
      expect(page.status_code).to eq(200)
    end

    it 'should get 200 status code in show the activity' do
      @activity = FactoryGirl.create(:activity)
      visit '/activities'
      click_link ('The activity')
      expect(page.status_code).to eq(200)
    end
  end

  describe 'cohorts' do
    it 'should get 200 status code in cohorts index' do
      click_link('Cohorts')
      expect(page.status_code).to eq(200)
    end
    it 'should get 200 status code in show the cohort' do
      @cohort = FactoryGirl.create(:cohort)
      visit '/cohorts'
      click_link ('The cohort')
      expect(page.status_code).to eq(200)
    end
  end

  describe 'Questions' do
    it 'should get 200 status code in questions index' do
      click_link('Questions')
      expect(page.status_code).to eq(200)
    end
    it 'should get 200 status code in show the question' do
      @question = FactoryGirl.create(:question)
      visit "/questions/#{@question.id}"
      expect(page.status_code).to eq(200)
    end
    it 'should get 200 status code in new question' do
      visit '/questions/new'
      expect(page.status_code).to eq(200)
    end
    it 'should get 200 status code in edit question' do
      @question = FactoryGirl.create(:question)
      visit "/questions/#{@question.id}/edit"
      expect(page.status_code).to eq(200)
    end
  end

  describe 'Quizzes' do
    it 'should get 200 status code in quizzes index' do
      visit "/quizzes"
      expect(page.status_code).to eq(200)
    end
    it 'should get 200 status code in show the quiz' do
      @quiz = FactoryGirl.create(:quiz, :with_questions, questions_count: 5)
      visit "/quizzes/#{@quiz.uuid}"
      expect(page.status_code).to eq(200)
    end
  end

  describe 'Students' do
    it 'should get 200 status code in students index' do
      # @cohort = FactoryGirl.create(:cohort, :cohort_with_students)
      click_link('Students')
      expect(page.status_code).to eq(200)
    end
  end

  describe 'Users' do
    it 'should get 200 status code in users index' do
      click_link('Users')
      expect(page.status_code).to eq(200)
    end
  end

end