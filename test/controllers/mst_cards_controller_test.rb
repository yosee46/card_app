require 'test_helper'

class MstCardsControllerTest < ActionController::TestCase
  setup do
    @mst_card = mst_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mst_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mst_card" do
    assert_difference('MstCard.count') do
      post :create, mst_card: { card_name: @mst_card.card_name, mana: @mst_card.mana, poto: @mst_card.poto, text: @mst_card.text, type: @mst_card.type }
    end

    assert_redirected_to mst_card_path(assigns(:mst_card))
  end

  test "should show mst_card" do
    get :show, id: @mst_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mst_card
    assert_response :success
  end

  test "should update mst_card" do
    patch :update, id: @mst_card, mst_card: { card_name: @mst_card.card_name, mana: @mst_card.mana, poto: @mst_card.poto, text: @mst_card.text, type: @mst_card.type }
    assert_redirected_to mst_card_path(assigns(:mst_card))
  end

  test "should destroy mst_card" do
    assert_difference('MstCard.count', -1) do
      delete :destroy, id: @mst_card
    end

    assert_redirected_to mst_cards_path
  end
end
