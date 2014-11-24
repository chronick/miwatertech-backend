class Api::V1::MeController < ApplicationController
  before_filter :get_current_user
  respond_to :json

  def get
    respond_with @user
  end

  def update
    @user.update permitted_params
    respond_with @user
  end

  def accounts
    @accounts = @user.accounts
    respond_with @user.accounts
  end

  def usage
    @account = @user.accounts.where(:id => params[:account_id]).first
    unless @account.nil?
      respond_with @account.readings
    else
      respond_with @account, status: :not_found
    end
  end

  protected

  def get_current_user
    # pretend to get the logged in user
    # get the actual one once we implement oauth login
    @user = User.first
  end

  def permitted_params
    params.permit(:email, :password, :password_confirmation)
  end
end
