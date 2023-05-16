class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @activities = current_user.activities
  end

  def new
    @activity = current_user.activities.build
  end

  def edit
    @activity = current_user.activities.find(params[:id])
  end

  def create
    @activity = current_user.activities.build(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to user_activities_path(current_user), notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @activity = current_user.activities.find(params[:id])
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to user_activities_path(current_user), notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity = current_user.activities.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to user_activities_path(current_user), notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def activity_params
      params.require(:activity).permit(:bodypart, :date, :caloriesburnt, :user_id)
    end
end



