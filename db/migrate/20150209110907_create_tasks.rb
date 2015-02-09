class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :done, default: false

      t.timestamps null: false
    end
  end
end
