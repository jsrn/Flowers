class Inventory
	@@items = {}
	@@item_count = 0

	def Inventory.view(owner)
		puts "Inventory:"
		puts "Capacity: " << @@items.length.to_s << "/" << (owner.str + 9).to_s
	end

	def Inventory.add_item(item)
		@@items << item
	end
end