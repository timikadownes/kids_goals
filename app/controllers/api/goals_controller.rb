
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

    @goal.name = params(:name)
    @goal.age = params(:age)
    @goal.grade = params(:grade)
    @goal.teacher = params(:teacher)
    @goal.school = params(:school)
    @goal.image_url = params(:image_url)
    
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
