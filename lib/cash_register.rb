require 'pry'

class CashRegister
	attr_accessor :total, :employee_discount, :items

	@@previous_item_total = 0

	def initialize(employee_discount = false)
		@total = 0
		@items = []
		@employee_discount = employee_discount
	end

	def self.total 
		@total
	end

	def add_item(item, price, quantity = 1)
		@total += price * quantity
		@@previous_item_total = price * quantity
		(quantity).times do 
			@items << item
		end
	end

	def discount
		@employee_discount
	end

	def apply_discount
		#binding.pry
		if @employee_discount
			@total = @total * (1 - (discount * 0.01))
			"After the discount, the total comes to $#{@total.to_i}."
		else
			"There is no discount to apply."
		end
	end

	def items
		@items
	end

	def void_last_transaction
		@total -= @@previous_item_total
	end

end
