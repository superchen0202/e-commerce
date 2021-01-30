require 'rails_helper'

RSpec.describe Cart, type: :model do


    let(:cart){Cart.new}

    describe "基本功能" do 
    
        #case 1
        it "可以把商品丟購物車，購物車就會有東西" do
            # cart = Cart.new
            cart.add_items(1)
            expect(cart.emtpy?).to be false    
        end

        #case 2
        it "加了相同種類的商品到購物車裡，購買項目並不會增加，但商品的數量會改變" do
            
            # cart = Cart.new
            
            cart.add_items(7, 3)                      # 3.times{cart.add_items(7)}
            cart.add_items(4, 5)                      # 5.times{cart.add_items(4)}
            cart.add_items(11, 2)                     # 2.times{cart.add_items(11)}

            expect(cart.items.count).to be 3          # 只有7號商品、4號商品跟11號商品3種商品 ==> 陣列中只存3種元素
            expect(cart.items.last.quantity).to be 2

        end

        #case 3
        it "商品可以放到購物車裡，也可以再拿出來" do 
            
            # cart = Cart.new
            p1 = FactoryBot.create(:product)
            
            cart.add_items(p1.id)
            
            expect(cart.items.first.product).to be_a Product    # != expect(cart.items.first.product).to kind_of Product
        end

        #case 4
        it "每個 Cart Item 都可以計算它自己的金額(小計)" do
            
            # cart = Cart.new

            p1 = FactoryBot.create(:product, sell_price: 5)
            p2 = FactoryBot.create(:product, sell_price: 9)
                        
            cart.add_items(p1.id, 3)
            cart.add_items(p2.id, 7)

            expect(cart.items.first.amount).to eq 15        # 3 * 5
            expect(cart.items.last.amount).to eq 63         # 7 * 9

        end

        #case 5
        it "可以計算整台購物車的總消費金額" do

            # cart = Cart.new

            p1 = FactoryBot.create(:product, sell_price: 5)
            p2 = FactoryBot.create(:product, sell_price: 9)
                        
            cart.add_items(p1.id, 3)            # amount = 15 = 3 * 5
            cart.add_items(p2.id, 7)            # amount = 63 = 7 * 9

            expect(cart.total_price).to eq 78

        end

        #case 6...TBD
        it "特別活動可搭配折扣(例如聖誕節的時候全面打 9 折，或是滿額滿千送百或滿額免運費)" do

            # cart = Cart.new
            # p1 = FactoryBot.create(:product, sell_price: 5)
            # cart.add_items(p1.id, 7)
            # p cart.special
        end

    end 

    describe "進階功能" do

        #case 1
        it "可以將購物車內容轉換成 Hash 並存到 Session 裡" do
            
            # cart = Cart.new

            p1 = FactoryBot.create(:product)
            p2 = FactoryBot.create(:product)
            
            cart.add_items(2, 3)
            cart.add_items(4, 7)

            # p cart.to_hash

            expect(cart.to_hash).to eq cart_hash
            
        end

        #case 2
        it "也可以存放在 Session 的內容(Hash 格式)，還原成購物車的內容" do
            
            cart = Cart.from_hash(cart_hash)

            #p cart.items
            expect(cart.items.first.quantity).to eq 3

        end

        def cart_hash
        
            return cart_content = {
                items: [
                    {"product_id": 2, "quantity": 3}, 
                    {"product_id": 4, "quantity": 7}
                ]
            }
    
        end

    end

end