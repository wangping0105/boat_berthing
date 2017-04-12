class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable#, :validatable

  acts_as_paranoid
  # has_secure_password
  has_one :api_key
  has_one :user_department
  has_one :department, through: :user_department
  has_one :attachment, as: :attachmentable

  validates_uniqueness_of :phone, conditions: -> { paranoia_scope }
  validates_presence_of :password, :message => "密码不能为空!"
  enum :role => { nomal: 0, admin: 1 }
  DEFAULT_PASSWORD = "11111111"

  before_save do
    self.name ||= self.phone
    self.name_pinyin = PinYin.of_string(self.true_name).join('').first(255)
  end

  after_save do
    ApiKey.create(user: self)
  end

  def admin?
    if role == 'super_admin'
      return true
    end
    false
  end

end
