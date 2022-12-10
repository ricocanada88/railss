class User < ApplicationRecord
    has_many :twitter_accounts
    has_many :tweets
    has_secure_password
    # /\A[^@\s]+@[^@\s]+\z/ : \A means ^(beginning of the line), \z means $(end of the line), \s means \f,\n,\r,\t,\v(white spaces, form feed)
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email" }
end
