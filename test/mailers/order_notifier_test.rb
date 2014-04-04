require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Attomsoft Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match /MyString1/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Attomsoft Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match /MyString1/, mail.body.encoded
  end

end
