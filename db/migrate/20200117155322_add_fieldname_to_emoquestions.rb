class AddFieldnameToEmoquestions < ActiveRecord::Migration[6.0]
  def change
    add_column :emoquestions, :is_correct_a, :integer
    add_column :emoquestions, :is_correct_b, :integer
  end
end
