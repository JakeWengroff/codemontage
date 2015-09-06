class FavoritesController < ApplicationController

  def create
    fp = FavoriteProject.new
    fp.user = current_user
    fp.project = Project.where(id: params[:project_id]).first

    respond_to do |format|
      format.json { render json: fp.save.to_json }
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    favorite = current_user.favorites.find(params[:id])

  if favorite.destroy
    flash[:success] = "Favorite was removed."
    redirect_to @project
  else
    flash[:error] = "Unable to remove favorite. Please try again."
    redirect_to @project
  end
end


end
