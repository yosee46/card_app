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
      user_card_ids << user_card.card_id
    end
    mst_cards = MstCard.find(user_card_ids)

    #表示用のモデル作成
    mst_cards.each do |mst_card|
      user_cards.each do |user_card|
        if (user_card.card_id == mst_card.id)
          view_model = CustomUserCard.new
          view_model.attributes = mst_card.attributes
          view_model.attributes = user_card.attributes
          @view_models << view_model
        end
      end
    end
  end

  #カードの所持数を追加して、jsonを返す
  def add_card
    mst_card = MstCard.find(params[:id])
    card_add_count = 1
    user_id = current_user.id
    card_group_no = 1

    #カードの所持数を更新
    @user_card = UserCard.find_by(:user_id => user_id, :card_id => mst_card.id, :card_group_no => card_group_no)
    if (@user_card.nil?)
      @user_card = UserCard.new(:user_id => user_id, :card_id => mst_card.id, :card_group_no => card_group_no, :count => card_add_count)
    else
      new_card_count = @user_card.count + card_add_count
      @user_card.count = new_card_count
    end
    @user_card.save!

    respond_to do |format|
      format.js
    end
  end

  #カードの所持数を追加して、jsonを返す
  def remove_card
    mst_card = MstCard.find(params[:id])
    card_add_count = -1
    user_id = current_user.id
    card_group_no = 1

    #カードの所持数を更新
    @user_card = UserCard.find_by(:user_id => user_id, :card_id => mst_card.id, :card_group_no => card_group_no)
    unless (@user_card.nil?)
      new_card_count = @user_card.count + card_add_count
      @user_card.count = new_card_count
      @user_card.save!
    end

    respond_to do |format|
      format.js
    end
  end

end
