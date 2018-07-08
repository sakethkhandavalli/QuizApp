class User < ApplicationRecord
  has_secure_password

  def Admin?
    self.role == 'Admin' 
  end

end
