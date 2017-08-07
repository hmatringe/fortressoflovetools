class User < ApplicationRecord
  after_create :send_welcome_email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
