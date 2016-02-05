class TrackCreators < ActiveRecord::Migration
  def change
    add_column :activities, :created_by_user_id, :integer
    add_column :cohorts, :created_by_user_id, :integer
    add_column :questions, :created_by_user_id, :integer
    add_column :quizzes, :created_by_user_id, :integer
    add_column :users, :created_by_user_id, :integer
  end
end
