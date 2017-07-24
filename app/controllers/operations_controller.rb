class OperationsController < ApplicationController
  def perform
	  cal = params[:cal_text].split(/(\d+\.?\d*)/).reject(&:empty?)
	  total = []
	  cal.each do |i|
	  	if i == "+"
	  		total << i
	  	elsif i == "-"
	  		total << i
	  	elsif i == "/"
	  		total << i
	  	elsif i == "*"
	  		total << i
	  	else
	  		total << i.to_f
	    end
	  end
	  total = total.join(" ")
	  @total = eval(total)
  end

  def new
  end
end
