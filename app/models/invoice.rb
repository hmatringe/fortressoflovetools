class Invoice < ApplicationRecord
  belongs_to :order

  mount_uploader :document, DocumentUploader

  scope :due_date_passed, -> { where("due_date < ?", Date.today) }
  scope :due_within_30_days, -> { where(due_date: Date.today..30.days.from_now) }
  scope :due_in_more_than_30_days, -> { where("due_date > ?", 30.days.from_now) }
  scope :unpaid, -> { where(payment_date: nil) }
  scope :paid, -> { where('payment_date is not null') }
end
