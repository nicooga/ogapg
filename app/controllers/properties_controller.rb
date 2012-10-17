class PropertiesController < ApplicationController
  def destroy
    @property = Property.find(params[:id])
    @product = @property.product
    @property.destroy

    respond_to do |format|
      format.html { redirect_to edit_product_path(@product) }
      format.json { head :no_content }
    end
  end
end
