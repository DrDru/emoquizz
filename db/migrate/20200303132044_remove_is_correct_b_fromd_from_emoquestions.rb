class RemoveIsCorrectBFromdFromEmoquestions < ActiveRecord::Migration[6.0]
  def change

    remove_column :emoquestions, :is_correct_b, :integer
  end
end
