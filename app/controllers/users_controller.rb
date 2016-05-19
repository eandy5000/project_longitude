class UsersController < ApplicationController

before_action :set_user, only: [:edit, :update, :show, :destroy]
before_action :require_same_user, only: [:edit, :update, :destroy]
before_action :require_admin, only: [:destroy]

    def index
        #note users plural
        @users = User.paginate(page: params[:page], per_page: 3)
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params) 
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Welcome #{@user.username}"
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        
        if @user.update(user_params)
            flash[:success] = "User was updated"
            redirect_to articles_path
        else 
            render 'edit'
        end
    end
    
    def show
       
    end
    
    def destroy
        @user.destroy
         flash[:danger] = "User and all articles deleted"
        redirect_to root_path
    end

private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    
    def set_user
        @user = User.find(params[:id])
    end
    
    def require_same_user
        if current_user != @user and !current_user.admin?
        flash[:danger] = "You can only edit your own account"
        redirect_to root_path
        end
    end
    
    def require_admin
        if logged_in? and !current_user.admin?
            flash[:danger] = "This is an admin function"
            redirect_to root_path
        end
    end
    
end