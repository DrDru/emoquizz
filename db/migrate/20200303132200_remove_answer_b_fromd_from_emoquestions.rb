class RemoveAnswerBFromdFromEmoquestions < ActiveRecord::Migration[6.0]
  def change

    remove_column :emoquestions, :answer_b, :string
  end
end
