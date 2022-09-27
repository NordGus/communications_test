class Api::V1::CommunicationsController < ApplicationController
  def adults
    @communications = Communication.includes(:attachments).for_adults
  end
end
