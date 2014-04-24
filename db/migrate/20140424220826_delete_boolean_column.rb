class DeleteBooleanColumn < ActiveRecord::Migration
  def change
    remove_column :to_dos, :boolean
  end
end
