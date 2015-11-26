class Product < ActiveRecord::Base
  has_many :orders

  SALES_TAX = 0.09
  DISCOUNT_THRESHOLD = 50

  def sale_message
     if price.to_i < 2
       "Discount Item!"
    else
       "On sale!"
    end
  end

  def tax
    price.to_i * SALES_TAX
  end

  def total
    price.to_i + tax
  end
end
