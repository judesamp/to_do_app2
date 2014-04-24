class CreateAssignee < ActiveRecord::Migration
  def change
    create_table :assignees do |t|
      t.string :name
      t.string :email
    end
  end
end
