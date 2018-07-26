
class Api::GoalsController < ApplicationController
  
  def index
    @goals = Goal.all
    render 'index.json.jbuilder'  
  end

  def show
    goal_id = params[:id]
    @goal =Goal.find(goal_id)
    render 'show.json.jbuilder'
  end

  def create
    @goal = Goal.new(
      category: params[:category],
      kid_id: params[:kid_id],
      image_url: params[:image_url],
      due_date: params[:due_date],
      description: params[:description]
      )
    
    if @goal.save
        render 'show.json.jbuilder'
    else
        render json: {errors: @goal.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    goal_id = params[:id]
    @goal = Goal.find(goal_id)

    @goal.category = params(:category)
    @goal.image_url = params(:image_url)
    @goal.due_date = params(:due_date)
    @goal.description = params(:description)
    @goal.kid_id = params(:kid_id)
    
    @goal.save
    render 'show.json.jbuilder'
  end

  def destroy
    goal_id = params[:id]
    @goal = Goal.find(goal_id)
    @goal.destroy
    render json: {message: "Goal successfully removed"}
  end

end
