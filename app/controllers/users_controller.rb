class UsersController < ApplicationController
      def new
        @user = User.new
      end

      def create
        @user = User.new(user_params)
        #@user = User.new(username: params[:username], password: params[:password], email: params[:email])

        if @user.save
            redirect_to new_user_path
        else
            render :new
        end
      end

      def edit
        @user = User.find(params[:id])
      end

      def update
        #raise params.inspect
        @user = User.find(params[:id])
        if @user.update(user_params)
          flash[:success] = " #{@user.username} has been updated. "          
          redirect_to "/users/#{params[:id]}/edit"
        else         
          render 'edit'
        end
      end

      private

      def user_params
        params.require(:user).permit(:username,:email,:password)
      end
end
