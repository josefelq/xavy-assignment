class Admin::ActivitiesController < Admin::ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @activities = Activity.by_name
  end

  def new
    @activity = Activity.new
  end

  def show
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      flash[:success] = 'Actividad fue creada exitosamente'
      redirect_to admin_activities_url
    else
      flash[:warning] = @activity.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @activity.update(activity_params)
      flash[:success] = 'Actividad fue actualizada exitosamente'
      redirect_to admin_activities_url
    else
      flash[:warning] = @activity.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @activity.destroy
      flash[:success] = 'Actividad fue destruida exitosamente'
      redirect_to admin_activities_url
    else
      flash[:warning] = @activity.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name,
                                  :description,
                                  :schedule,
                                  :venue_id,
                                  :difficulty,
                                  :tag_list)
  end
end
