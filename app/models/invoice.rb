class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy
  has_many :items, through: :invoice_items, dependent: :destroy
  has_many :transactions, dependent: :destroy

  validates_presence_of :status

  def self.destroy_empty_invoices
    invoices = Invoice.all
    invoices.each do |invoice|
      if invoice.invoice_items == []
        invoice.destroy
      end
    end
  end
end