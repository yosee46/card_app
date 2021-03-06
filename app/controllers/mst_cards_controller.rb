class MstCardsController < ApplicationController

  # GET /mst_cards
  # GET /mst_cards.json
  def index
    @mst_cards = MstCard.all
  end

  def search
    search_name = params[:search]
    if (search_name[:search] === "search_by_name")
      @mst_cards = MstCard.where('card_name like ?', "%" + params[:card] + "%")
    elsif (search_name[:search] === "search_by_text")
      @mst_cards = MstCard.where('text like ?', "%" + params[:card] + "%")
    else
      @mst_cards = Array.new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mst_card
      @mst_card = MstCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mst_card_params
      params.require(:mst_card).permit(:card_name, :mana, :card_type, :poto, :text)
    end
end
