class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products

  email_regex = /\A.+@.+\..+$\z/
  card_regex = /\d{16}/
	validates_presence_of :name, :email, :card, :password, :password_confirmation, :message => :required
	validates_length_of :name, {:maximum => 25, :message => :too_long}
	validates :email, format: {:with => email_regex, :message => :invalid}
	validates :card, format: {:with => card_regex, :message => :invalid}

end