class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
