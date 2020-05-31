class User < ApplicationRecord
  validates :username, presence: true,
                       length: { minimum: 3, maximum: 10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/
  validates :password,  presence: true,
                        confirmation: true,
                        # :length => {:within => 6..40},
                        format: { with: VALID_PASSWORD_REGEX },
                        on: :create
  validates :password,  confirmation: true,
                        # :length => {:within => 6..40},
                        format: { with: VALID_PASSWORD_REGEX },
                        allow_blank: true,
                        on: :update
end
