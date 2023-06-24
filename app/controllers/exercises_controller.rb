class ExercisesController < ApplicationController
  def index
    @body_part_list = ExerciseApiService.get_bodyparts

    if params[:bodyPart]
      body_part_name = ExerciseApiService.fuzzy_match_body_part(params[:bodyPart])
      @exercises = ExerciseApiService.filter_by_body_part(body_part_name)
    else
      @exercises =  ExerciseApiService.get_exercises
    end

    @items = Kaminari.paginate_array(@exercises).page(params[:page]).per(2)
    
    if @items.out_of_range?
      redirect_to url_for(page: @items.total_pages)
    end
    
    respond_to do |format|
      format.html
      format.json { render json: @items }
    end
  end

  def show
    @exercise =  ExerciseApiService.get_exercise(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @exercise }
    end
  end
end