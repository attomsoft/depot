require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
		fixtures :products

	test "buying a product" do

		LineItem.delete_all
		Order.delete_all
		onebook = products(:one)

		#try access store index page
		get "/"
		assert_response :success
		assert_template :index

		#try add a product to cart
		xml_http_request :post, '/line_items', product_id:onebook.id	
		assert_response :success

		cart = Cart.find(session[:cart_id])
		assert_equal 1, cart.line_items.size
		assert_equal onebook, cart.line_items[0].product

		# try checking out
		get '/orders/new'
		assert_response :success
		assert_template :new
			# place order
		post_via_redirect '/orders', order: {
								name: "Dave Jones",
								address: "Somewhere in USA",
								email: "dave@example.org",
								pay_type: "Check"}

		assert_response :success
		assert_template :index
		cart = Cart.find(session[:cart_id])
		assert_equal 0, cart.line_items.size

			# checking order result
		orders = Order.all
		assert_equal 1, orders.size
		order = orders[0]

		assert_equal 'Dave Jones', order.name
		assert_equal 'Somewhere in USA', order.address
		assert_equal 'dave@example.org', order.email
		assert_equal 'Check', order.pay_type

		assert_equal 1, order.line_items.size
		line_item = order.line_items[0]
		assert_equal onebook, line_item.product

			#checking email sent
		mail = ActionMailer::Base.deliveries.last
		assert_equal ["dave@example.org"], mail.to
		assert_equal "Attomsoft Store Order Shipped", mail.subject
	end
end
