class ContactBook < ApplicationRecord

    belongs_to :contactable, polymorphic: true
    enum status: %i(pending activated deactivated), _default: :pending
    validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
end
