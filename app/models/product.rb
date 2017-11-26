class Product < ApplicationRecord
  has_many :order_lines, dependent: :destroy
  has_many :orders, through: :order_lines
  has_many :inventory_primary_lines, dependent: :destroy
  belongs_to :supplier, optional: true
  has_many :purchase_order_draft_lines

  validates :SKU, presence: true
  validates :name, presence: true
  validates :size, presence: true
  validates :color, presence: true
  validates :structure, presence: true
  validates :category, presence: true
  validates :heal_thickness, presence: true
  validates :platform, presence: true
  validates :material, presence: true
  validates :heal_height, presence: true
  validates :closing_type, presence: true
  validates :EAN, presence: true
  validates :woocommerce_product_id, presence: true

  def select_label
    "#{self.name.capitalize} - Size: #{self.size } - #{self.color} - #{self.SKU}"
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
end
