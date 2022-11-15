class Offer < ApplicationRecord
  belongs_to :tender_product, foreign_key: 'IdTenderProduct'
  belongs_to :invitation, foreign_key: 'IdTenderInvitation'

  self.table_name = 'TenderInvitationItm'
  self.primary_key = 'IdTenderInvitationItm'
end
