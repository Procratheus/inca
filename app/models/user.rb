class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Associations
  has_many :histories

  # Refile method
  attachment :profile_image, type: :image

  enum role: { standard: 0, moderator: 1, admin: 2 }

  # Custom validations
  validates :name, presence: true

  protected

  def admin
    self.role == "admin"
  end

  def admin_invite
    if admin?
      self.update(invitation_limit: 1000)
    else
      self.update(invitation_limit: 0)
    end
  end

end
