require 'currency_converter'

class ActionsController < ApplicationController
	before_filter :authenticate_user!


	def index
	end

	def topup
		if params.has_key?(:commit)
			current_user.credit = current_user.credit.to_f + params[:user][:credit].to_f
			current_user.save
		end
		render "index"
	end

	def transfer
		if params.has_key?(:commit)
			if to = User.find_by_phone_number(params[:user][:transfer_to].to_s)

				if current_user.currency == to.currency
					to.credit = to.credit.to_f + params[:user][:amount].to_f
				else
					rate = CurrencyConverter.checkcurrency("EUR", "USD")
					to.credit = to.credit.to_f + params[:user][:amount].to_f * rate
				end

				current_user.credit = current_user.credit.to_f - params[:user][:amount].to_f
				current_user.save
			
				to.save
			else
				alert = "error"
			end
		end
		render "index"
	end

end
