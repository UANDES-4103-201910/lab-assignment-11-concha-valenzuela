class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types

  accepts_nested_attributes_for :ticket_types, reject_if: lambda {|attributes| attributes['price'].blank?}

  has_attached_file :avatar, style: { medium: "140x140>", thumb: "10x10>"}, default_url: "/images/:style/missing.png", validate_media_type: false
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def ticket_types_for_form
    collection = ticket_types.where(event_id: id)
    collection.any? ? collection : ticket_types.build
  end
end
