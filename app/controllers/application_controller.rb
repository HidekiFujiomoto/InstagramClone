class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # 全コントローラーでSessionsHelperを使用できるようにする
  include SessionsHelper
end
