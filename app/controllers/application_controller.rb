class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, except: [:top], unless: :admin_controller?
  before_action :configure_authentication

  private
  # 現在のコントローラーが管理者用かどうかに基づいて適切な認証メソッド
  # （authenticate_user! または authenticate_admin!）を呼び出します。
  # このメソッドはbefore_actionで実行されます。
  def configure_authentication
    if admin_controller?
      authenticate_admin!
    else
      authenticate_user! unless action_is_public?
    end
  end

  # 現在のコントローラがAdmin名前空間の下にあるかどうかを判定
  def admin_controller?
    self.class.module_parent_name == 'Admin' # 動いているコントローラがAdminモジュール下ならTrueを返す
  end

  # 特定のアクションで認証が不要かどうかを判定(ここではhomes#top)
  def action_is_public?
    controller_name == 'home' && action_name == 'top'
  end
end
