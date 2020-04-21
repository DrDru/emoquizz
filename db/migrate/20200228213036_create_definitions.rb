class CreateDefinitions < ActiveRecord::Migration[6.0]
  def change
    create_table :definitions do |t|
      t.string :entry

      t.timestamps
    end
  end
end
