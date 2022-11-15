class InvitationController < ApplicationController
  def show
    @invitation = Invitation.select(:SubmitTime, :IdTenderInvitation, :SendTime,
                                    :IdTender, :IdCustomerInfo, :FirstVisitTime)
      .includes(:tender, :customer).find_by(UniqueKey: params[:key])

    render json: @invitation,
           include: [tender: { only: %i[Subject ClosingDate TenderNo ClosingDate Cur Note InvitationText],
                               include: [tender_products:
                                  { only: %w[IdCommodityProduct Qty PercentageInput AmountInput],
                                    methods: %w[formula publication product offer_type] }] },
                     customer: { only: %i[Title] }]
  end

  def visit
    @invitation = Invitation.find_by(UniqueKey: params[:key])
    @invitation.update(FirstVisitTime: Time.now)
    render json: 'Success'
  end

  def offer
    @invitation = Invitation.find_by(UniqueKey: params[:key])

    offers = offers_params['offers']
    offers.each do |offer|
      if Offer.where(IdTenderInvitationItm: offer['IdTenderInvitationItm']).length.zero?
        @offer = Offer.new
        @offer.tender_product = TenderProduct.find(offer['IdTenderProduct'])
        @invitation.offers << @offer
      else
        @offer = Offer.find(offer['IdTenderInvitationItm'])
        puts '--------------------'
      end

      @offer.Qty = offer['Qty']
      @offer.Price = offer['Price']
      @offer.PlusMinusPercent = offer['PlusMinusPercent']
      @offer.PlusMinusAmount = offer['PlusMinusAmount']
      @offer.save
    end

    render json: 'Success'
  end

  def offers_params
    params.permit(:key,
                  offers: %i[IdTenderInvitationItm IdTenderProduct Qty Price PlusMinusPercent PlusMinusAmount
                             Percentage])
  end
end
