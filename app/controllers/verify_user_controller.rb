class VerifyUserController < ApplicationController

  before_action :authenticate_user, :set_user
  # POST /auth/get_otp
  def get_otp
    if MessagingService.send_otp? @user.mobile
      render status: :ok, json: {status: 'otp_sent'}
    else
      render status: :service_unavailable
    end
  end

  # POST /auth/verify_otp
  def verify_otp
    if MessagingService.verify_otp? @user.mobile, otp_params[:otp]
      render status: :ok, json: {status: 'verification_successful'}
    else
      render status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def otp_params
    params.fetch(:auth, {}).permit(:otp)
  end

end
