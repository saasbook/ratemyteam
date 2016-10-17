class InitialMigration < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :lms_sid
      t.string :institution_sid
      t.string :given_name
      t.string :family_name
    end
    create_table :ratings do |t|
      t.references :student
      t.references :rater
      t.references :iteration
    end
    create_table :iterations do |t|
      t.string :description
      t.datetime :start
      t.datetime :end
    end
  end
end
