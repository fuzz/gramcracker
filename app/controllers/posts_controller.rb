class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :edit, :like, :new, :update]
  before_action :set_post, only: [:show, :edit, :email, :like, :update, :destroy]

  def like
    # Only one like per user, please
    unless Like.where(post_id: @post.id, user_id: current_user.id).first
      Like.create(post_id: @post.id, user_id: current_user.id)
    end

    redirect_back fallback_location: @post
  end

  def email
    # No need to collect the same email address more than once
    unless EmailSignup.where(email: params[:post][:email]).first
      EmailSignup.create(email: params[:post][:email], post_id: @post.id)
    end

    redirect_to @post
  end

  def popular
    @posts = Post.by_popularity.page params[:page]

    # respond_to do |format|
    #   format.html { render :index }
    # end
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order(created_at: :desc).page params[:page]
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:description, :email, :image, :page)
    end
end
