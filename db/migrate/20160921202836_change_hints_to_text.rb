class ChangeHintsToText < ActiveRecord::Migration
  def up
    change_column :category_hints, :text, :text
end
def down
    # This might cause trouble if you have strings longer
    # than 255 characters.
    change_column :category_hints, :text, :string
end
end
