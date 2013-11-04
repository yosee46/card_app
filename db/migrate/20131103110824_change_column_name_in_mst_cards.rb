class ChangeColumnNameInMstCards < ActiveRecord::Migration
  def change
    rename_column :mst_cards, :type, :card_type
  end
end
