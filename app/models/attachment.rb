class Attachment < ApplicationRecord
  belongs_to :communication, class_name: "Communication"
end
