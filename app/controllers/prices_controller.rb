class PricesController < ApplicationController
  def destroy
    @price = Price.find(params[:id])
    @product = @price.product
    @price.destroy

    respond_to do |format|
      format.html { redirect_to edit_product_path(@product) }
      format.json { head :no_content }
    end
  end
end
