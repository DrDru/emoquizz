class DefinitionsController < ApplicationController

	def show
		  @definition  = Definition.find_by(entry: params[:id])
	end	
end
