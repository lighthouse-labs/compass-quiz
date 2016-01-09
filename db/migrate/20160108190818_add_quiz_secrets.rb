class AddQuizSecrets < ActiveRecord::Migration
  def change
    add_column :quizzes, :uuid, :string
    add_column :submissions, :uuid, :string
  end
end
