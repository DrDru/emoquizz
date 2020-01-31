class CreateEmoquestions < ActiveRecord::Migration[6.0]
  def change
    create_table :emoquestions do |t|
      t.string :emoji
      t.string :answer_a
      t.string :answer_b

      t.timestamps
    end
  end
end
