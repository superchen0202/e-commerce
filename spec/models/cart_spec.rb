require 'rails_helper'

RSpec.describe Cart, type: :model do

    describe "基本功能" do 
    
        it "可以把商品丟購物車，購物車就會有東西" do
            cart = Cart.new
            cart.add_items(1)
            expect(cart.emtpy?).to be false    
        end

        it "加了相同種類的商品到購物車裡，購買項目並不會增加，但商品的數量會改變" do
            
            cart = Cart.new
            
            3.times{cart.add_items(7)}
            5.times{cart.add_items(4)}

            # p cart.items
            # p cart.items.count
            # p cart.items.amount
            # p cart.items.first
            # p cart.items.last

            expect(cart.items.count).to be 2                #只有7號商品跟2號商品
            expect(cart.items.first.quantity).to be 3

        end
    





      end 
    




      describe "進階功能" do 
      end


end