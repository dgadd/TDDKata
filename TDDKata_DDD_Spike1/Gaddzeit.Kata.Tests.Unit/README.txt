ROUGH DRAFT

Level 1: Add invoice line item and decrement inventory
Level 2: Handle break-out cases as follows: A case of 12 bottles can be ordered as individual bottles up to 6. Any higher, and an entire case must be ordered instead (3 =3, 5=5, 7=case, 15 = 2 cases)
Level 3: Customer changes address, have new invoice reflect new address, old invoice reflect old one
Level 4: Cancellation of invoice as it is being shipped, what are the expectations?

#######################


Given_that_I_have_an_inventory_system_of_products
	When_I_add_a_new_product_to_the_inventory_system
		Then_that_product_should_be_listed_in_inventory_by_brand_and_model
	When_I_receive_a_qty_from_a_shipment_for_a_product
		Then_the_product_count_should_be_incremented_by_that_qty

Given_that_I_have_an_invoicing_system_to_sell_products
When_I_create_an_invoice_with_a_product_selected_from_inventory
Then_the_product_should_be_added_to_the_invoice

Given_that_I_have_an_invoicing_system_to_sell_products
When_I_create_an_invoice_with_a_product_selected_from_inventory
Then_the_product_item_should_be_decremented_from_inventory.