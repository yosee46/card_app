class AddIndexToUserCards < ActiveRecord::Migration
  def change
    add_index :user_cards, [:user_id, :card_id], :name => "IDX_User_Cards_1"
    add_index :user_cards, [:user_id, :card_group_no], :name => "IDX_User_Cards_2"
  end

  def down
  end
end
