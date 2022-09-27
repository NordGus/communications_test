require "test_helper"

class Communication::ValidationsTest < ActiveSupport::TestCase
  test "valid" do
    communication = Communication.new(
      creator: people(:director),
      receiver: people(:adult),
      subject: "Test"
    )

    assert communication.valid?
  end

  test "invalid because creator is blank" do
    communication = Communication.new(
      receiver: people(:adult),
      subject: "Test"
    )

    assert_not communication.valid?
    assert_equal [{:error=>:blank}], communication.errors.details[:creator]
  end

  test "invalid because receiver is blank" do
    communication = Communication.new(
      creator: people(:director),
      subject: "Test"
    )

    assert_not communication.valid?
    assert_equal [{:error=>:blank}], communication.errors.details[:receiver]
  end

  test "invalid because subject is blank" do
    communication = Communication.new(
      creator: people(:director),
      receiver: people(:adult),
    )

    assert_not communication.valid?
    assert_equal [{:error=>:blank}], communication.errors.details[:subject]
  end
end
