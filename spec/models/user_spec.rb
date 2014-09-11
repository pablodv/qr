require 'rails_helper'

RSpec.describe User, :type => :model do
  context "Associations" do
    it { should belong_to :token }
  end

 context "Validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :phone }
    it { should validate_presence_of :dob }
    it { should validate_presence_of :token_id }
    it { should_not validate_inclusion_of(:allergic).in_array([nil]) }
    it { should_not validate_inclusion_of(:asthmatic).in_array([nil]) }
    it { should_not validate_inclusion_of(:celiac).in_array([nil]) }
    it { should_not validate_inclusion_of(:diabetic).in_array([nil]) }
  end
end
