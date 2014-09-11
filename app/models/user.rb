class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # == Associations
  #
  belongs_to :token

  # == Accessors
  #
  attr_accessor :token

  # == Validations
  #
  validates :first_name, :last_name, :dob, :address, :phone, :token_id,
            presence: true, on: :update
  validates :allergic, :asthmatic, :celiac, :diabetic,
            inclusion: { in: [true, false] }, on: :update

  # == Callbacks
  #
  after_create :set_token

  # == Scopes
  #
  scope :by_code, ->(code){ joins(:token).where("tokens.code = ?", code) }
  scope :with_token, -> { where("token_id IS NOT NULL") }

  protected

  def set_token
    if token = Token.available_by_code(self.token).first.try(:id)
      update_attribute(:token_id, token)
    end
  end
end
