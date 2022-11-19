class TenderProduct < ApplicationRecord
  belongs_to :tender, foreign_key: 'IdTender'
  has_many :offers, foreign_key: 'IdTenderProduct'

  def product
    id = self.IdCommodityProduct.split(',')[0]
    Dl.find(id).Title
  end

  def publication
    return nil if self.IdPublication.zero?
    return 'fixed' if self.IdPublication == 999_999

    Dl.find(self.IdPublication).Title
  end

  def offer_type
    arr = []
    arr << 'Percentage' if self.PercentageInput == 1
    arr << 'Amount' if self.AmountInput == 1
    arr
  end

  def formula
    return nil if self.IdFormula.zero?

    Formula.find(self.IdFormula).Title
  end

  self.table_name = 'TenderProduct'
  self.primary_key = 'IdTenderProduct'
end
