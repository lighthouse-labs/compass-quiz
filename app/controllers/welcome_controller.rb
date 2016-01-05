class WelcomeController < ApplicationController

  def index
    @welcome = {
      cohorts_count: Cohort.count
    }
  end

end
