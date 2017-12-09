class CreateHumen < ActiveRecord::Migration[5.1]
  def change
    create_table :humen do |t|
      t.string :name
      t.integer :age
      t.string :bio

      t.timestamps
    end
  end
end
