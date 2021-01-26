require 'rails_helper'

RSpec.describe CartItem, type: :model do


    describe "基本功能" do 

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

end