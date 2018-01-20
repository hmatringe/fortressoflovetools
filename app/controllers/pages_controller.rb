class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def components
  	@dinner = [{Topping: 'Boots', Slices: 34},
				      {Topping: 'Pumps', Slices: 23},
				      {Topping: 'Pumps Laces', Slices: 1}]

  	@sales1_title =	"Sales 1 I come from the controller"
  	@sales1 = [['Boots', 33],
				       ['Pumps', 33],
				 	     ['Pumps Laces', 33]]

  	@sales2_title =	"Sales 2 I come from the controller"
  	@sales2 =	[ ['Boots', 10],
				      	['Pumps', 10],
	      				['Pumps Laces', 80]]

    @sols = SalesOrderLine.all
  end

  def cogs
  end
end
