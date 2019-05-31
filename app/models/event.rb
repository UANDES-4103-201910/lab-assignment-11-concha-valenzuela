class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types
  accepts_nested_attributes_for :ticket_types
  has_attached_file :avatar, style: { medium: "140x140>", thumb: "10x10>"}, default_url: "/images/:style/missing.png", validate_media_type: false
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
