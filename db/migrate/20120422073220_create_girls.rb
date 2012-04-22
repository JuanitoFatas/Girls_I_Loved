class CreateGirls < ActiveRecord::Migration
  def change
    create_table :girls do |t|
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
