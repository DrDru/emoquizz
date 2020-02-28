class AddContentToDefinition < ActiveRecord::Migration[6.0]
  def change
    add_column :definitions, :content, :text
  end
end
