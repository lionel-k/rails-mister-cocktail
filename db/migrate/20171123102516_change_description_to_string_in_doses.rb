class ChangeDescriptionToStringInDoses < ActiveRecord::Migration[5.1]
  def change
    change_column :doses, :description, :string
  end
end
