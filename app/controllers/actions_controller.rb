class ActionsController < ApplicationController
	before_filter :authenticate_user!

	def index
		
	end

	def topup
		if params.has_key?(:commit)
			current_user.credit = current_user.credit.to_f + params[:user][:credit].to_f
			current_user.save
			render "index"
		else
			render :layout => false	
		end
	end

	def transfer
		if params.has_key?(:commit)
			if to = User.find_by_phone_number(params[:user][:to_phone_number].to_s)

				to.credit = to.credit.to_f + params[:user][:amount].to_f

				current_user.credit = current_user.credit.to_f - params[:user][:amount].to_f
				current_user.save
			
				to.save
			else
				alert = "error"
			end
			
			render "index"
		else
			render :layout => false	
		end
	end

end
