require 'rails_helper'

RSpec.describe Cart, type: :model do

    describe "基本功能" do 
    
        it "可以把商品丟購物車，購物車就會有東西" do
          cart = Cart.new
          cart.add_items(1)
          expect(cart.emtpy?).to be false    
        end
    
      end 
    
      describe "進階功能" do 
      end
    




end