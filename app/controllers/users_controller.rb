class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  include UsersHelper

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("new_user", partial: "users/form", locals: { user: User.find(params[:id]) } ) 
      end
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.turbo_stream {
          render turbo_stream: [
            turbo_stream.prepend("users", partial: "users/user", locals: {user: @user}),
            turbo_stream.update("new_user", partial: "users/form", locals: {user: User.new}) ,
            turbo_stream.update("message_count", html: "#{User.count}")          
          ]
        } 
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.turbo_stream {
          render turbo_stream: turbo_stream.update("new_user", partial: "users/form", locals: {user: @user})
        } 
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.turbo_stream do
          render turbo_stream: [
              turbo_stream.update(@user),
              turbo_stream.update("new_user", partial: "users/form", locals: { user: User.new })
          ]
        end
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.turbo_stream do
          render turbo_stream: [
              turbo_stream.update("new_user", partial: "users/form", locals: { user: @user })
          ]
        end
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.turbo_stream{
        render turbo_stream: [
          turbo_stream.remove(@user),
          turbo_stream.update("message_count", html: "#{User.count}")
        ]
      }
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # POST /user/search
  def search
    respond_to do |format|
      if params[:name_search].present?
        @search_result = search_query(params[:name_search])
      else
        @search_result = []
      end
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("search_res", partial: "users/search_results",
              locals: {searches: @search_result}),
              turbo_stream.update("search_output", html: "Total #{@search_result.count}")
          ]
        end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :age)
    end
end
