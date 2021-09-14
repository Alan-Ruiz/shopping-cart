class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  # LOGIC
  def total_price
    self.quantity * self.product.price
  end

  def destroy
  @line_item = LineItem.find(params[:id])
  @line_item.destroy
  redirect_to cart_path(@current_cart)
  end

end
