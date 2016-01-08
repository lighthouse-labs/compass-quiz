class ActivitiesController < ApplicationController

  before_action :set_activity, only: [:show, :destroy]

  def index
    @activities = Activity.all
    @activity = Activity.new
  end

  def show
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activities_url, notice: "#{activity_title(@activity)} was successfully created."
    else
      @activities = Activity.all
      render :index
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_url, notice: "#{activity_title(@activity)} was successfully destroyed."
  end

  def activity_title(activity)
    name = activity.try(:title)
    name = 'Activity' if name.blank?
    name
  end

  helper_method :activity_title

  protected

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :day, :compass_install, :compass_primary_key)
  end

end
