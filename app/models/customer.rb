class Customer < ApplicationRecord
  has_many :invitations, foreign_key: 'IdCustomerInfo'

  self.table_name = 'CustomerInfo'
  self.primary_key = 'IdCustomerInfo'
end
