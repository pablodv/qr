require 'rails_helper'

RSpec.describe Token, :type => :model do
  context "Associations" do
    it { should have_one :user }
  end

 context "Validations" do
    it { should validate_presence_of :code }
    it { should validate_presence_of :qr_code }
  end
end
