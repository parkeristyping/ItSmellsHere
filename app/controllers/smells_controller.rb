class SmellsController < ApplicationController
  def index
    @smells = Smell.all
    @smells_json = Smell.jsonify
  end

  def last
    @smell = Smell.last
    respond_to do |format|
      format.json {render json: @smell}
    end
  end

  def create
    @user = User.find_or_create_by(user_params[:user])
    @smell = Smell.create(smell_params)
    @user.smells << @smell
    @user.save
    sidebar = render partial: 'smell', locals: {smell: @smell}
    new_smell = {
                 id: @smell.id,
                 content: @smell.content,
                 lat: @smell.lat,
                 lng: @smell.lng,
                 user: {
                   twitter_id: @smell.user.twitter_id,
                   twitter_handle: @smell.user.twitter_handle,
                   name: @smell.user.name
                 },
                 sidebar: sidebar
                }
    WebsocketRails[:smells].trigger(:new, new_smell)
  end

  private
  def smell_params
    params.require(:smell).permit(:content, :lat, :lng)
  end

  def user_params
    params.require(:smell).permit(user: [:twitter_id, :twitter_handle, :name])
  end
end
