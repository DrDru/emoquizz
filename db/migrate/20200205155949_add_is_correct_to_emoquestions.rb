class AddIsCorrectToEmoquestions < ActiveRecord::Migration[6.0]
  def change
    add_column :emoquestions, :is_correct, :integer
  end
end
