class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :api_key
end
