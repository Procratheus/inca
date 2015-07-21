class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Refile method
  attachment :profile_image

  # Custom validations
  validates :name, presence: true

  def admin?
    self.roles == true
  end

  def admin_invite
    if admin?
      self.update(invitation_limit: nil)
    else
      self.update(invitation_limit: 0)
    end
  end

end
