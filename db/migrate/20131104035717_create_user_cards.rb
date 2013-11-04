class CreateUserCards < ActiveRecord::Migration
  def change
    create_table :user_cards do |t|
      t.integer :user_id, :null => false, :default => 0
      t.integer :card_id, :null => false, :default => 0
      t.integer :card_group_no, :null => false, :default => 0
      t.integer :count, :null => false, :default => 0

      t.timestamps
    end
  end
end
