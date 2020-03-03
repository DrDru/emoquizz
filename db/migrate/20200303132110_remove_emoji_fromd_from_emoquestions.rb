class RemoveEmojiFromdFromEmoquestions < ActiveRecord::Migration[6.0]
  def change

    remove_column :emoquestions, :emoji, :string
  end
end
