class Tender < ApplicationRecord
  has_many :invitations, foreign_key: 'IdTender'

  self.table_name = 'Tender'
  self.primary_key = 'IdTender'
end
