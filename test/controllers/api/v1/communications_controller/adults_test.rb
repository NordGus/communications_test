require 'test_helper'

class Api::V1::CommunicationsController::AdultsTest < ActionDispatch::IntegrationTest
  test "should get adults" do
    get adults_api_v1_communications_url

    assert_response :success

    parsed_body = response.parsed_body.deep_symbolize_keys

    assert parsed_body[:communications].present?
    assert_includes(
      parsed_body[:communications],
      {
        id: communications(:two).id,
        creator_id: communications(:two).creator_id,
        receiver_id: communications(:two).receiver_id,
        subject: communications(:two).subject,
        contents: communications(:two).contents,
        previous_communication_id: communications(:two).previous_communication_id,
        attachment_count: communications(:two).attachments.count
      }
    )
    assert_includes(
      parsed_body[:communications],
      {
        id: communications(:three).id,
        creator_id: communications(:three).creator_id,
        receiver_id: communications(:three).receiver_id,
        subject: communications(:three).subject,
        contents: communications(:three).contents,
        previous_communication_id: communications(:three).previous_communication_id,
        attachment_count: communications(:three).attachments.count
      }
    )
  end
end