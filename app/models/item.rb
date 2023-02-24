class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price

  def self.search_name_fragment(query)
    where("name ilike ?", "%#{query.downcase}%").order(:name).first
  end

  def self.search_price(min = nil, max = nil)
    if max == nil
      where("unit_price >= ?", min).order(:name).first
    elsif min == nil
      where("unit_price <= ?", max).order(:name).first
    else
      where("unit_price >= ?", min).where("unit_price <= ?", max).order(:name).first
    end
  end
end