class User < ActiveRecord::Base
    has_many :articles
    validates :username, presence: true,
        uniqueness: {case_sensitive: false}, 
        length: {minimum: 3, maximum:25}
    valid_email_address=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true,
    length: {maximum:105},
    uniqueness: {case_sensitive: false},
    format:{with: valid_email_address}
    
end