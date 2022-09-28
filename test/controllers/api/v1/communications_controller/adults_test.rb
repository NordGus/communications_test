require 'test_helper'

class Api::V1::CommunicationsController::AdultsTest < ActionDispatch::IntegrationTest
  test "should succeed" do
    get adults_api_v1_communications_url

    assert_response :success
  end

  test "should contain communications array" do
    get adults_api_v1_communications_url

    assert parsed_body[:communications].present?
  end

  test "should contain only communications for adults" do
    get adults_api_v1_communications_url

    assert_not_equal Communication.count, parsed_body[:communications].length
  end

  test "should contain the expected communications amount" do
    get adults_api_v1_communications_url

    assert_equal expected_communications.length, parsed_body[:communications].length
  end

  test "should contained expected communications" do
    get adults_api_v1_communications_url

    extra_items = parsed_body[:communications] - expected_communications
    missing_items = expected_communications - parsed_body[:communications]

    assert extra_items.empty? && missing_items.empty?
  end

  private

  def parsed_body
    @parsed_body ||= response.parsed_body.deep_symbolize_keys
  end

  def expected_communications
    [
      {
        id: communications(:two).id,
        creator_id: communications(:two).creator_id,
        receiver_id: communications(:two).receiver_id,
        subject: communications(:two).subject,
        contents: communications(:two).contents,
        previous_communication_id: communications(:two).previous_communication_id,
        attachment_count: communications(:two).attachments.count
      },
      {
        id: communications(:three).id,
        creator_id: communications(:three).creator_id,
        receiver_id: communications(:three).receiver_id,
        subject: communications(:three).subject,
        contents: communications(:three).contents,
        previous_communication_id: communications(:three).previous_communication_id,
        attachment_count: communications(:three).attachments.count
      }
    ]
  end
end