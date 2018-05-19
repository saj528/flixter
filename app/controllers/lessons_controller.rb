class LessonsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :user_enrolled!

  def show
  end

  private

  def user_enrolled!
    if current_user.enrolled_in?(current_lesson.section.course) != true
      redirect_to :back, :alert => "You must be enrolled to view lesson!"
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end