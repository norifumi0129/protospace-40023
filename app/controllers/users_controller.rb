class UsersController < ApplicationController
  def show
    @user = Prototype.find(params[:id]).user
    @user = User.find(params[:id])
    @prototypes = @user.prototypes
  end
end