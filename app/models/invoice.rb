class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy
  has_many :items, through: :invoice_items, dependent: :destroy
  has_many :transactions, dependent: :destroy

  validates_presence_of :status

  def self.destroy_empty_invoices
    empty_invoices = Invoice.left_joins(:items).select("items.*, invoices.*").where(items: {id: nil})
    empty_invoices.each do |invoice|
      invoice.destroy
    end
  end
end