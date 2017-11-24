class AddPreparationToCocktails < ActiveRecord::Migration[5.1]
  def change
    add_column :cocktails, :preparation, :string
  end
end
