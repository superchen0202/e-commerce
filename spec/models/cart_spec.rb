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
            2.times{cart.add_items(11)}

            expect(cart.items.count).to be 3                #只有7號商品、4號商品跟11號商品3種商品 ==> 陣列中只存3種元素
            expect(cart.items.last.quantity).to be 2

        end

        it "商品可以放到購物車裡，也可以再拿出來" do 
            
            cart = Cart.new
            p1 = FactoryBot.create(:product)
            
            cart.add_items(p1.id)
            
            expect(cart.items.first.product).to be_a Product    # != expect(cart.items.first.product).to kind_of Product
        end

        it "每個 Cart Item 都可以計算它自己的金額(小計)" do
            
            cart = Cart.new

            p1 = FactoryBot.create(:product, sell_price: 5)
            p2 = FactoryBot.create(:product, sell_price: 9)
                        
            cart.add_items(p1.id, 3)
            cart.add_items(p2.id, 7)

            expect(cart.items.first.amount).to eq 15        # 3 * 5
            expect(cart.items.last.amount).to eq 63         # 7 * 9

        end


      end 


      describe "進階功能" do 
      end

end