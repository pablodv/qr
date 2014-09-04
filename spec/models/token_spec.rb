require 'rails_helper'

RSpec.describe Token, :type => :model do
  #context "Associations" do
  #  it { should belong_to :user }
  #end

 context "Validations" do
    it { should validate_presence_of :code }
    it { should validate_presence_of :qr_code }
    #it { should validate_presence_of :user_id }
  end
end
