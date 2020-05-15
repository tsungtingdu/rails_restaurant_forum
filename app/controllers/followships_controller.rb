# frozen_string_literal: true

class FollowshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @followship = current_user.followships.build(following_id: params[:following_id])

    if @followship.save
      flash[:notice] = 'Followed!'
    else
      flash[:alert] = @followship.errors.full_messages.to_sentence
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @followship = current_user.followships.where(following_id: params[:id]).first
    if @followship
      @followship.destroy
      flash[:notice] = 'Unfollowed!'
    else
      flash[:alert] = 'Unfollowed ALREADY!!'
    end
    redirect_back(fallback_location: root_path)
  end
end
