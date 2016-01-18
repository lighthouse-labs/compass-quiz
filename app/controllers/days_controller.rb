class DaysController < ApplicationController

  skip_before_action :authenticate_user

  layout 'public'

  def show
    @questions = Question.joins(:activity).where(activities: {day: params[:id].upcase, compass_install: params[:compass_install]})
  end

end
