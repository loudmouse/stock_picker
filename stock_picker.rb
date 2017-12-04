#https://www.theodinproject.com/courses/ruby-programming/lessons/building-blocks#project-2-stock-picker
#Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
#It should return a pair of days representing the best day to buy and the best day to sell.
#Days start at 0.

#  > stock_picker([17,3,6,9,15,8,6,1,10])
#  => [1,4]  # for a profit of $15 - $3 == $12

#Quick Tips:
#You need to buy before you can sell
#Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.


#defines the stock picker method which accepts an array for the argument
def stock_picker stock_prices
  #generates an array of random numbers which are the stock prices for each day
  stock_prices = Array.new(10) { rand(1...10) }
  #sets profit at 0 to start
	profit = 0
  #loops through each item in the array from beginning to end
	for i in 0...stock_prices.length
    #also loops through each item but moves once place ahead of i for each iteration
		for j in (i+1)...stock_prices.length
      #if the value of subtracting i from j is greater than the value of the profit variable...
			if((stock_prices[j] - stock_prices[i]) > profit)
        #set the new value of profit to the value at j minus the value at i
				profit = stock_prices[j] - stock_prices[i]
        #next set the buy date to whatever i's value is
				buy = i
        #and set the seel date to whatever j's value is
				sell = j
			end
		end
	end
  #creates a new array with the buy day and the sell day
	days_of_transactions = [buy, sell]
  puts "You've got quite for buying and selling stock. You've consistently bought low and sold high to maximize your profits per share."
  #puts the array of buy and sell day
  puts "The stock prices of ACME over the past 10 days were:"
  stock_prices.each { |price|
  puts "$#{price}"
  }
	puts "The index of days in the array at which you bought and sold were: #{days_of_transactions}."
  puts "Very well done. You made a profit of $#{profit}/share of ACME."
end

#calls the stock picker method with the stock prices instance variable
stock_picker(@stock_prices)
