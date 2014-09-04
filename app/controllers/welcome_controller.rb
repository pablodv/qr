require 'rqrcode_png'

class WelcomeController < ApplicationController

  def index
    qr = RQRCode::QRCode.new('http://10.0.0.4:3000/welcome', size: 4, level: :h)
    @png = qr.to_img
  end

  def show
  end
end
