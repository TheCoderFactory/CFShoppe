require_dependency "shoppe/application_controller"

module Shoppe
  class PromotionsController < ApplicationController
    before_action :set_promotion, only: [:show, :edit, :update, :destroy]

    # GET /promotions
    def index
      @promotions = Promotion.all
    end

    # GET /promotions/1
    def show
    end

    # GET /promotions/new
    def new
      @promotion = Promotion.new
    end

    # GET /promotions/1/edit
    def edit
    end

    # POST /promotions
    def create
      @promotion = Promotion.new(promotion_params)
      @promotion.user_id = current_user.id

      if @promotion.save
        redirect_to promotions_path, notice: 'Promotion was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /promotions/1
    def update
      if @promotion.update(promotion_params)
        redirect_to @promotion, notice: 'Promotion was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /promotions/1
    def destroy
      @promotion.destroy
      redirect_to promotions_url, notice: 'Promotion was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_promotion
        @promotion = Promotion.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def promotion_params
        params.require(:promotion).permit(:name, :code, :start_date, :expiry_date, :used_on_date, :reason, :value, :usage_limit)
      end
  end
end
