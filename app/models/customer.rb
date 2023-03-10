class Customer < ApplicationRecord
  has_many :invoices, dependent: :destroy

  validates_presence_of :first_name
  validates_presence_of :last_name
end