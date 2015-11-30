# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  email             :string
#  first_name        :string
#  last_name         :string
#  crypted_password  :string(128)      default(""), not null
#  password_salt     :string(128)      default(""), not null
#  persistence_token :string
#  login_count       :integer          default(0)
#  last_request_at   :datetime
#  current_login_at  :datetime
#  last_login_at     :datetime
#  current_login_ip  :string
#  last_login_ip     :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts, allow_destroy: true

  acts_as_authentic do |opts|
    opts.merge_validates_length_of_password_field_options(
        {
            minimum: 8,
            message: 'Your password is too short!'
        })
  end

  #validation
  validates :email, presence: true, uniqueness: true,
            length: {within: 7..40},
            format: {with: /\A(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}\z/i }
  validates :first_name, presence: true, length: {within: 2..30}
  validates :last_name, presence: true, length: {within: 2..30}

  def full_name
    self.first_name.titleize + ' ' + self.last_name.gsub('O\'','O\' ').titleize.gsub('O\' ','O\'')
  end

  #resource: http://avatar.rubyforge.org/
  # def Avatar
  #     email_address = params[:email].downcase
  #     hash =Digest::MD5.hexdigest(email_address)
  #     image_src="http://www.gravatar.com/avatar/#{hash}"
  # end
  before_save :save_user_md5
  def save_user_md5
    self.img_mb5 = Digest::MD5.hexdigest(self.email)
  end
  def adorable_avatar(size)
    hash = self.img_mb5
    size = "#{size}x#{size}"
    src = "http://api.adorable.io/avatars/#{size}/#{hash}.png"
    return src
  end
end
