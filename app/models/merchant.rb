class Merchant < ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :items
  
  validates_presence_of :name
end