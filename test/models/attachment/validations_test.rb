require "test_helper"

class Attachment::ValidationsTest < ActiveSupport::TestCase
  test "valid" do
    attachment = Attachment.new(communication: communications(:one))

    assert attachment.valid?
  end

  test "invalid because communication is blank" do
    attachment = Attachment.new

    assert_not attachment.valid?
    assert_equal [{:error=>:blank}], attachment.errors.details[:communication]
  end
end
