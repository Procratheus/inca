class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

  ## Give invite functionality to an admin user
  before_save :admin_invite

  protected

  def admin?
    self.roles == true
  end

  def admin_invite
    self.update(invitation_limit: 0) if admin?
  end

end
