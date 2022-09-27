class Communication < ApplicationRecord
  AGE_MAYORITY = 18

  belongs_to :creator, class_name: "Person", foreign_key: :creator_id
  belongs_to :receiver, class_name: "Person", foreign_key: :receiver_id
  belongs_to :previous_communication, class_name: "Communication", foreign_key: :previous_communication_id, optional: true

  has_many :subsequent_communications, class_name: "Communication", foreign_key: :previous_communication_id
  has_many :attachments, class_name: "Attachment"

  validates_presence_of :subject

  scope :for_adults, -> { joins(:receiver).where("people.birthdate <= ?", AGE_MAYORITY.years.ago) }

  def attachment_count
    @attachment_count ||= attachments.count
  end
end
