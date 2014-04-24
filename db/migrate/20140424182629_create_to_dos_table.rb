class CreateToDosTable < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :task
      t.text :description
      t.string :completed
      t.string :boolean, default: false
      t.date :due_date
      t.integer :assignee_id
    end
  end
end
