class PostsController < ApplicationController
before_action :setPost, only: [:edit, :update, :show, :destroy]
before_action :requireUser, except: [:index, :show]
before_action :requireSameUser, only: [:edit, :update, :destroy]

def index
  @posts = Post.paginate(page: params[:page], per_page: 20)
end

def new
  @post = Post.new
end

def create
  @post = Post.new(postParams)
  @post.user = currentUser
  if @post.save
    flash[:success] = "Post successfully added."
    redirect_to post_path(@post)
  else
    render 'new'
  end
end

def update
  if @post.update(postParams)
    flash[:success] = "Post successfully updated."
    redirect_to post_path(@post)
  else
    render 'edit'
  end
end

def show
end

def edit
end


def destroy
  @post.destroy
  flash[:danger] = "Item successfully deleted."
  redirect_to posts_path
end

private
  def postParams
    params.require(:post).permit(:title, :description,   category_ids:[])
  end

  def setPost
    @post = Post.find(params[:id])
  end

  def requireSameUser
    if currentUser != @post.user and !currentUser.admin
      flash[:danger] = "You can only edit or delete your own items"
      redirect_to root_path
    end
  end
end
