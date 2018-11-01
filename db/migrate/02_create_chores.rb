class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :type
      t.string :description
      t.string :room
      t.string :day
    end
  end
end
