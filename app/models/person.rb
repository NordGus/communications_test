class Person < ApplicationRecord
  has_many :communications_created, class_name: "Communication", foreign_key: :creator_id
  has_many :communications_received, class_name: "Communication", foreign_key: :receiver_id

  validates_presence_of :name, :birthdate
end
