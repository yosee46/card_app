class UserController < ApplicationController
  def index
    user_id = current_user.id unless current_user.nil?
    @view_models = Array.new

    #ユーザデータ取得
    card_group_no = 1
    user_cards = UserCard.where("user_id = ? and card_group_no = ?", user_id, card_group_no)
    return if user_cards.nil?

    #マスターデータ取得
    user_card_ids = Array.new
    user_cards.each do |user_card|
      user_card_ids << user_card.id
    end
    mst_cards = MstCard.find(user_card_ids)

    #表示用のモデル作成
    mst_cards.each do |mst_card|
      user_cards.each do |user_card|
        if (user_card.card_id === mst_card.card_id)
          view_model = CustomUserCard.new
          view_model.attributes = mst_card.attributes
          view_model.attributes = user_card.attributes
          @view_models << view_model
        end
      end
    end



  end
end
