class User < ActiveRecord::Base
  has_many :documents
  has_many :assignments
  has_many :roles, through: :assignments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def user_security
    roles = Role.all
    roles.find_all { |x| x.security_access <= user.roles.first.security }
  end

  def role?
    self.roles.first.name
  end

end
