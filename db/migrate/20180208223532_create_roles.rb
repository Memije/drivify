class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
