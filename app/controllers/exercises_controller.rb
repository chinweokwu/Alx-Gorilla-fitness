class ExercisesController < ApplicationController
  def index
    @body_part_list = ExerciseApiService.get_bodyparts

    if params[:bodyPart]
      body_part_name = ExerciseApiService.fuzzy_match_body_part(params[:bodyPart])
      @exercises = ExerciseApiService.filter_by_body_part(body_part_name)
      @items = Kaminari.paginate_array(@exercises).page(params[:page]).per(12)

    else
      @exercises = Exercise.get_exercises
      @items = Kaminari.paginate_array(@exercises).page(params[:page]).per(10)

    end

    respond_to do |format|
      format.html
      format.json { render json: @items }
    end
  end

  def show
    @exercise = Exercise.get_exercise(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @exercise }
    end
  end
end