class UsersController < ApplicationController

before_filter :authenticate_user!, :except => [:some_action_without_auth]
load_and_authorize_resource
  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
 def new
    @user = User.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end 

  def edit
   @user = User.find(params[:id]) 
  end

  def create
    @user = Customer.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Customer was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to :action => :index, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
end
  # DELETE /resource
  def destroy
     @user = User.find(params[:id])
     sign_out_and_redirect(self.resource)
  end
end 
