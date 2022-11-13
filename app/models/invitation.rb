class Invitation < ApplicationRecord
  belongs_to :Tender, foreign_key: 'IdTender'

  self.table_name = 'TenderInvitation'
  self.primary_key = 'IdTenderInvitation'
end
