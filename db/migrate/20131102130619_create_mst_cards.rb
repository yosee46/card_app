class CreateMstCards < ActiveRecord::Migration
  def change
    create_table :mst_cards do |t|
      t.string :card_name
      t.string :mana
      t.string :type
      t.string :poto
      t.string :text

      t.timestamps
    end
  end
end
