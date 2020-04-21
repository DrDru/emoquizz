class RemoveAnswerAFromdFromEmoquestions < ActiveRecord::Migration[6.0]
  def change

    remove_column :emoquestions, :answer_a, :string
  end
end
