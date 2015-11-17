# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  email                :string
#  first_name           :string
#  last_name            :string
#  crypted_password     :string(128)      default(""), not null
#  password_salt        :string(128)      default(""), not null
#  persistence_token    :string
#  perishable_token     :string(128)
#  single_access_token  :string
#  login_count          :integer          default(0)
#  failed_login_count   :integer          default(0)
#  last_request_at      :datetime
#  current_login_at     :datetime
#  last_login_at        :datetime
#  current_login_ip     :string
#  last_login_ip        :string
#  active               :boolean          default(FALSE), not null
#  user_group_id        :integer
#  activation_token     :string
#  password_reset_token :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class User < ActiveRecord::Base

  belongs_to :user_group
  has_many :posts, dependent: :destroy
  acts_as_authentic do |c|
    if Rails.env.production?
      c.logged_in_timeout = 30.minutes
    else
      c.logged_in_timeout = 90.minutes
    end
  end

# validation
  validates :email, presence: true, uniqueness: true,
            length: {within: 7..40},
            format: {with: /\A(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}\z/i }
  validates :first_name, presence: true, length: {within: 2..30}
  validates :last_name, presence: true, length: {within: 2..30}
  validates :password, presence: true, length: {minimum: 6}, on: :create
  validates :password, allow_nil: true, allow_blank: true, length: {minimum: 6}, on: :update
  validates :user_group_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  # validates :user_group_id,
  #           inclusion: {in: UserGroup.full_list_of_ids}, unless: 'Rails.env.test?'
  validates_confirmation_of :password, unless: 'password.blank?'

# callbacks
  before_destroy :check_dependencies

# scopes
  scope :all_in_order, -> { order(:user_group_id, :last_name, :first_name) }

# instance methods
  def full_name
    self.first_name.titleize + ' ' + self.last_name.gsub('O\'','O\' ').titleize.gsub('O\' ','O\'')
  end

  def admin?
    self.user_group.is_an_admin
  end

  def manager?
    self.user_group.is_a_manager
  end

  def destroyable?
    false
  end

# class methods
  def self.activate_with_code(the_code)
    user = User.where(activation_code: the_code).first
    if user
      user.activation_code = nil
      user.active = true
      unless user.save
        Rails.logger.warn 'User.activate_with_code failed to save: ' + user.inspect
      end
      user
    else
      false
    end
  end

  def self.send_password_reset(email_address)
    user = User.where(login: email_address).first
    if user
      user.activation_code = ApplicationController.generate_random_code(20)
      user.crypted_password = 'locked'
      user.active = false
      user.save
      UserMailer.password_reset_email(user).deliver
    end
  end

  def self.validate_reset_code(the_code)
    User.where(active: false, activation_code: the_code).first
  end

  def self.reset_password_with_code(the_code, new_password_1, new_password_2)
    user = User.validate_reset_code(the_code.to_s)
    if user
      user.activation_code = nil
      user.active = true
      user.password = new_password_1.to_s
      user.password_confirmation = new_password_2.to_s
      if user.save
        return user
      else
        Rails.logger.warn 'User.reset_password_with_code failed to save: ' + @user.inspect
        return nil
      end
    else
      Rails.logger.warn 'User.reset_password_with_code failed to find a user: ' + the_code.to_s
      return nil
    end
  end

  def self.list_of_ids
    User.all.map(&:id)
  end

  protected

  def check_dependencies
    unless self.destroyable?
      errors.add(:base, "Couldn't be deleted because dependencies exist")
      false
    end
  end

end
