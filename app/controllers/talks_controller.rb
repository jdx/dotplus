class TalksController < ApplicationController

  before_filter :authenticate!

  def index
    @talks = current_user.talks
  end

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(talk_params)
    @talk.city = current_city
    @talk.user = current_user
    if @talk.save
      flash[:success] = "Talk Submitted"
      redirect_to talks_path
    else
      render :new
    end
  end

  def edit
    @talk = current_user.talks.find(params[:id])
  end

  def update
    @talk = current_user.talks.find(params[:id])
    if @talk.update_attributes(talk_params)
      flash[:success] = "Talk Updated"
      redirect_to talks_path
    else
      render :edit
    end
  end

  private
  def talk_params
    params.require(:talk).permit(:title, :description)
  end
end
