class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  protected

  def admin?
    self.roles == true
  end

end
