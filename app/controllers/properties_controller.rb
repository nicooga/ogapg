class PropertiesController < ApplicationController
  def destroy
    @property = Property.find(params[:id])
    @product = @product.product
    @property.destroy

    respond_to do |format|
      format.html { redirect_to edit_product_path(@property) }
      format.json { head :no_content }
    end
  end
end
