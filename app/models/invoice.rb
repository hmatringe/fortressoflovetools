# == Schema Information
#
# Table name: invoices
#
#  id                            :integer          not null, primary key
#  amount_in_invoice_currency    :decimal(11, 4)
#  invoice_currency              :string
#  amount_in_accounting_currency :decimal(11, 4)
#  issue_date                    :date
#  due_date                      :date
#  payment_date                  :date
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  order_id                      :integer
#  document                      :string
#  reference                     :string
#

class Invoice < ApplicationRecord
  belongs_to :order

  mount_uploader :document, DocumentUploader

  validates :amount_in_invoice_currency, presence: true
  validates :invoice_currency, presence: true
  validates :amount_in_accounting_currency, presence: true
  validates :issue_date, presence: true
  validates :due_date, presence: true
  validates :document, presence: true
  validates :reference, presence: true, uniqueness: true


  scope :due_date_passed, -> { where("due_date < ?", Date.today) }
  scope :due_within_30_days, -> { where(due_date: Date.today..30.days.from_now) }
  scope :due_in_more_than_30_days, -> { where("due_date > ?", 30.days.from_now) }
  scope :unpaid, -> { where(payment_date: nil) }
  scope :paid, -> { where('payment_date is not null') }
end
