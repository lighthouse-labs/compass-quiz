class Activity < ActiveRecord::Base

  has_many :questions, dependent: :nullify

  validates :compass_install, presence: true

  validates :compass_primary_key, numericality: { greater_than: 0, only_integer: true }

  validates :title, presence: true

  validates :day, presence: true

  default_scope { order(:compass_install, :day, :title) }

end
