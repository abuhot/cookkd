class FriendsController < ApplicationController
  def index
    @friends = current_user.friends
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new
    @friend.friend_id = params[:friend_id]
    @friend.user_id = params[:user_id]

    if @friend.save
      redirect_to "/friends", :notice => "Friend created successfully."
    else
      render 'new'
    end
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])

    @friend.friend_id = params[:friend_id]
    @friend.user_id = params[:user_id]

    if @friend.save
      redirect_to "/friends", :notice => "Friend updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @friend = Friend.find(params[:id])

    @friend.destroy

    redirect_to "/friends", :notice => "Friend deleted."
  end
end
