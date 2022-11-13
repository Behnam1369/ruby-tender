class InvitationController < ApplicationController
  def show

    @invitation = Invitation.select(:SubmitTime, :IdTenderInvitation, :SendTime,
                                    :IdTender, :IdCustomerInfo).includes(:tender, :customer).find_by(UniqueKey: params[:key])

    render json: @invitation,
           include: [tender: { only: %i[Subject ClosingDate TenderNo ClosingDate Cur Note InvitationText],
                               include: [tender_products: { only: ['IdCommodityProduct'],
                                                            methods: %w[formula publication product offer_type] }] }, 
                    customer: {only: %i[Title]}                                
                    ]
  end
end
