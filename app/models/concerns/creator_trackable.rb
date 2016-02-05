module CreatorTrackable

  extend ActiveSupport::Concern

  included do

    belongs_to :created_by, class_name: 'User', foreign_key: :created_by_user_id

  end

end
