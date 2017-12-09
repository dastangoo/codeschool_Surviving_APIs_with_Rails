class CreateMedicalKits < ActiveRecord::Migration[5.1]
  def change
    create_table :medical_kits do |t|
      t.string :name
      t.string :components

      t.timestamps
    end
  end
end
