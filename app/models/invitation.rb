class Invitation < ApplicationRecord
  belongs_to :tender, foreign_key: 'IdTender'
  belongs_to :customer, foreign_key: 'IdCustomerInfo'
  has_many :offers, foreign_key: 'IdTenderInvitation'

  self.table_name = 'TenderInvitation'
  self.primary_key = 'IdTenderInvitation'
end
