class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        flash.now[:notice] = "Post has been created."
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.prepend("posts", partial: "posts/post", locals: { post: @post }),
            turbo_stream.update("modal", " "),
            turbo_stream.update("flash", partial: "layouts/flash")
          ]
        end
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("modal", partial: "posts/form", locals: { post: @post })
          ]
        end
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        flash.now[:notice] = "Post has been Updated."
          format.turbo_stream do
            render turbo_stream:[ 
              turbo_stream.replace(@post, partial: "posts/post", locals: { post: @post }),
              turbo_stream.update("flash", partial: "layouts/flash"),
              turbo_stream.update("modal", " ")
            ]
          end
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      flash.now[:notice] = "Post has been Deleted."
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove(@post),
          turbo_stream.update("flash", partial: "layouts/flash"),
        ]
      end
      format.html { redirect_to posts_url, status: :see_other ,notice: "Post was successfully destroyed." }
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
      params.require(:post).permit(:title, :body)
    end
end