class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.boolean :admin
      t.string :name
      t.text :text
      t.timestamps
    end
  end
end
