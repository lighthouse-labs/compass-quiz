class Activity < ActiveRecord::Base

  include CreatorTrackable

  has_many :questions, dependent: :nullify

  validates :compass_install, presence: true

  validates :compass_primary_key, numericality: { greater_than: 0, only_integer: true }

  validates :title, presence: true

  validates :day, presence: true

  before_save do
    self.day = day.upcase if day
  end

  default_scope { order(:compass_install, :day, :title) }

end
