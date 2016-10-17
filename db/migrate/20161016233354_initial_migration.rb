class InitialMigration < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :ucb_sid
      t.string :name
    end
    create_table :ratings do |t|
      t.integer :stars
      t.string :comments
      t.references :student
      t.references :rater
      t.references :iteration
    end
    create_table :iterations do |t|
      t.string :description
      t.string :lms_courseid
      t.datetime :start
      t.datetime :end
    end
  end
end
