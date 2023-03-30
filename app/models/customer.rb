class Customer < ApplicationRecord

   attr_accessor :address ,:city
   belongs_to :service_provider
   belongs_to :user
   has_many :contact_books, as: :contactable
   has_many :addresses, as: :addressable

   has_one_attached :aadhar_image
   validates :aadhar_number, presence: true, numericality: { only_integer: true }, length: { is: 12 }
   validates :email, presence: true, uniqueness: true
   validates :first_name, :last_name, presence: true, length: { minimum: 2 }
   # validates :aadhar_image, presence: true 
   attr_accessor :phone

   after_update :sim_activated

   after_create :customer_mailer

   def customer_mailer
     CustomerMailer.new_customer_create(self).deliver_now
   end

   def sim_activated
      if contact_books.activated
        CustomerMailer.update_status(self).deliver_now
      else 
        puts "not"
      end
   end
end