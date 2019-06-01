class TicketTypesController < ApplicationController




	def new
    	@ticket_type = TicketType.new
    	2.times { @ticket_type.ticket_zones.build }
 	end
	def event_params
      params.fetch(:ticket_type, {}).permit(:ticket_zone_id, :price, :event_id, ticket_zone_attributes: [:zone])
    end
end
