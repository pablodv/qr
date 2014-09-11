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

  protected

  def generate_qr_code
    if code.present?
      qr_code_img  = RQRCode::QRCode.new("http:/10.0.0.4:3000/user/#{code}", size: 4, level: :h).to_img
      self.qr_code = qr_code_img.to_string
    end
  end
end
