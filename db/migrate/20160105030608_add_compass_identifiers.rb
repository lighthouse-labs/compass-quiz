class AddCompassIdentifiers < ActiveRecord::Migration
  def change
    add_column :cohorts, :compass_install, :string
    add_column :cohorts, :compass_primary_key, :integer, index: true
    add_column :activities, :compass_install, :string
    add_column :activities, :compass_primary_key, :integer, index: true
    add_column :students, :compass_install, :string
    add_column :students, :compass_primary_key, :integer, index: true
  end
end
