# == Schema Information
#
# Table name: products
#
#  id                     :integer          not null, primary key
#  SKU                    :string
#  name                   :string
#  size                   :string
#  color                  :string
#  structure              :string
#  category               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  parentSKU              :string
#  supplier_id            :integer
#  heel_thickness         :integer
#  platform               :boolean
#  material               :string
#  heel_height            :string
#  closing_type           :string
#  EAN                    :integer
#  woocommerce_product_id :string
#  parent_product_id      :integer
#

class Product < ApplicationRecord
  has_many :order_lines, dependent: :destroy
  has_many :orders, through: :order_lines
  has_many :inventory_primary_lines, dependent: :destroy
  has_many :sales_order_lines, dependent: :destroy
  belongs_to :supplier
  belongs_to :parent_product
  has_many :purchase_order_draft_lines, dependent: :destroy
  has_many :out_of_stock_ranges, dependent: :destroy
  has_many :out_of_stock_days, through: :out_of_stock_ranges

  validates :SKU, presence: true, uniqueness: true
  validates :EAN, presence: true, uniqueness: true, unless: "9999999999"
  validates :name, presence: true
  validates :size, presence: true
  validates :color, presence: true
  validates :structure, presence: true
  validates :category, presence: true
  validates :heel_thickness, presence: true
  # validates :platform, presence: true
  validates :material, presence: true#, inclusion: {in: %w(combo suede napa)} 
  validates :heel_height, presence: true
  validates :closing_type, presence: true
  validates :woocommerce_product_id, presence: true, uniqueness: true, unless: "0"

  def select_label
    "#{self.name.capitalize} - #{self.size } - #{self.SKU}"
  end

  def short_name
    "#{self.name.capitalize} - #{self.size }"
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |p|
        csv << p.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # Product.create! row.to_hash to just import new products each time
      product = find_by(SKU: row["SKU"]) || new
      product.attributes = row.to_hash
      product.save
    end
  end

  def days_out_of_stock_since(period_start)
     out_of_stock_days.reject{|d| d.date < period_start}.count
  end
end
