class SmellsController < ApplicationController
  def index
    @smells = Smell.all
  end

  def create
    @user = User.find_or_create_by(smell_params[:user])
    @smell = Smell.create(smell_params[:smell])
    @user.smells << @smell
    @user.save
  end

  private
  def smell_params
    params.require(:smell).permit(smell: [:content, :lat, :lng], user: [:twitter_id, :twitter_handle, :name])
  end
end
