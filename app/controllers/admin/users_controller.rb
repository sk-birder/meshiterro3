class Admin::UsersController < ApplicationController
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_dashboards_path, notice: 'ユーザを削除しました。'
  end
end
