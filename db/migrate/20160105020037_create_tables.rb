class CreateTables < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      t.timestamps null: false
    end
    create_table :activities do |t|
      t.string :day
      t.string :title
      t.timestamps null: false
    end
    create_table :quizzes do |t|
      t.string :day
      t.references :cohort, index: true
      t.timestamps null: false
    end
    add_foreign_key :quizzes, :cohorts
    create_table :questions do |t|
      t.text :question
      t.boolean :active, default: true
      t.references :activity, index: true
      t.timestamps null: false
    end
    add_foreign_key :questions, :activities
    create_table :questions_quizzes do |t|
      t.references :question, index: true
      t.references :quiz, index: true
      t.timestamps null: false
    end
    add_foreign_key :questions_quizzes, :questions
    add_foreign_key :questions_quizzes, :quizzes
    create_table :options do |t|
      t.text :answer
      t.text :explanation
      t.boolean :correct
      t.references :question, index: true
      t.timestamps null: false
    end
    add_foreign_key :options, :questions
    create_table :students do |t|
      t.string :github_username
      t.references :cohort, index: true
      t.timestamps null: false
    end
    add_foreign_key :students, :cohorts
    create_table :submissions do |t|
      t.references :quiz, index: true
      t.references :student, index: true
      t.timestamps null: false
    end
    add_foreign_key :submissions, :quizzes
    add_foreign_key :submissions, :students
    create_table :answers do |t|
      t.references :option, index: true
      t.references :submission, index: true
      t.timestamps null: false
    end
    add_foreign_key :answers, :options
    add_foreign_key :answers, :submissions
  end
end
