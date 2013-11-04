class AddCardImgToMstCards < ActiveRecord::Migration
  def change
    add_column :mst_cards, :card_img_path, :string
  end
end
