class UsersController < ApplicationController
  def show
    @comments = Comment.includes(:user).all.order(created_at: :desc)
  end
end