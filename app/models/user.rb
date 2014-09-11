class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # == Associations
  #
  belongs_to :token

  # == Validations
  #
  validates :first_name, :last_name, :dob, :address, :phone, :token_id,
            presence: true, on: :update
  validates :allergic, :asthmatic, :celiac, :diabetic,
            inclusion: { in: [true, false] }, on: :update
end
