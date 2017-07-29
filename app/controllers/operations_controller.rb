class OperationsController < ApplicationController
  def perform 
    # final_result = ''
    factors = params[:cal_text]
    ['/', '*', '+', '-'].each do |op|
      check_oprator=-1
      while check_oprator = factors.index(op,(check_oprator+1))
        cal_array = Array.new
        back_value = Array.new
        front_value = Array.new
        prev_counter = next_counter = check_oprator                 
        extract_end_counter  = 2
        extract_start_counter = 0
        next_val_checklist = prev_val_checklist = ('0'..'9').to_a
        next_val_checklist.push('.')
        prev_val_checklist.push('.')
        while next_val_checklist.include? factors[next_counter + 1]
          front_value.push(factors[next_counter + 1])
          extract_end_counter+=1
          next_counter +=1
        end 
        while prev_val_checklist.include? factors[prev_counter - 1]
          back_value.push(factors[prev_counter - 1])
          prev_counter -=1
          extract_start_counter+=1
          (prev_counter == 0)? (break;) : ''                       
        end
        filter_prev_val = back_value.reverse.join('').to_f
        filter_next_val = front_value.join('').to_f
        cal_array.push(filter_prev_val)
        cal_array.push(filter_next_val)   
        after_calc = cal_array.inject(op.to_sym)
        after_calc =   after_calc.round(2).to_s 
        factors.slice!(prev_counter , extract_end_counter+(extract_start_counter-1))
        factors.insert(prev_counter, after_calc)
        refector_operator = factors.index(op)
        check_oprator-=1  unless refector_operator.nil? 
      end
      @total = factors
    end
  end

  def new
  end
  
end
