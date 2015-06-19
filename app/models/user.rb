class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products

  email_regex = /\A.+@.+\..+$\z/
  card_regex = /\A\d+\z/
  name_regex = /\A\w+\z/

	validates_presence_of :name, :email, :card, :password, :password_confirmation, :message => :required
	validates_length_of :name, {:maximum => 25, :message => :too_long}
	validates_format_of :name, {:with => name_regex, :message => :invalid}
	validates_uniqueness_of :name, :email, :card, {:message => :taken} 

	validates :email, format: {:with => email_regex, :message => :invalid}
	validates :email, length: {:maximum => 25, :message => :too_long}
	validates :card, format: {:with => card_regex, :message => :invalid}
	validates :card, length: {:is => 16, :message => :invalid}

end