class CashRegister
  attr_accessor :total, :discount, :prev_transaction, :items
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(title, price, quantity = 1)
    @total += price * quantity
    for i in 1..quantity
      @items << title
    end
    @prev_transaction = price * quantity
  end
  
  def apply_discount
    @total -= @total.to_f * @discount.to_f / 100
    if @discount == 0
      "There is no discount to apply."
    else
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    @total = @total - @prev_transaction
  end
end