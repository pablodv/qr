class Token < ActiveRecord::Base
  dragonfly_accessor :qr_code

  # == Associations
  #
  has_one :user

  # == Validations
  #
  validates :code, :qr_code, presence: true

  # == Callbacks
  #
  before_validation :generate_qr_code

  # == Scopes
  #
  scope :available_by_code, ->(code) do
    where("code = ? AND id NOT IN(?)", code, User.with_token.map(&:token_id))
  end

  protected

  def generate_qr_code
    if code.present?
      qr_code_img  = RQRCode::QRCode.new("http:/10.0.0.4:3000/user/#{code}", size: 4, level: :h).to_img
      self.qr_code = qr_code_img.to_string
    end
  end
end
