

#new tables to make

bundle exec rake elasticsearch:start

bundle exec rake environment elasticsearch:import:model CLASS='Customer'


https://hackhands.com/building-has_many-model-relationship-form-cocoon/




DUE BY TODAY
-Make an initiative model  + show page
-Make associations from the initiative to 1. Vendors and 2. Target Accts
- associate product groups with bi_vendors and with bi_companies and with initiatives
-Display top accts per vendor and glaring holes in the businesses


-add a vendor showpage and add to search!
  (shows top customers using that vendor and top customers to target)
  (customers that spend the highest $$ on similar items)


-fix up associatiosn

-put tabs on the company show page



1. sales overview
2. vendor overview  DONE


BiOrders
BiQuotes
BIInventory (later.. when i know how it works)

rails g model BiOrder order_number:integer order_suffix:integer line_number:integer ship_prod:string prod_desc:string warehouse:string bi_customer_no:integer  customer_po:string ship_to_name:string ship_to_address1:string ship_to_city:string ship_to_state:string prod_cost_cents:integer price_cents:integer sales_cents:integer bi_inside_sales_rep_id:integer bi_outside_sales_rep_id:integer prod_category:string bi_vendor_no:integer qty_ord:integer enter_date:datetime promise_date:datetime request_date:datetime


rails g model BiOutsideSalesRep no:string name:string

rails g model BiInsideSalesRep no:string name:string

#their ID should be their no ..
rails g model BiCustomer code:integer  name:string customer_type:string  

#their ID should be their no ..
rails g model BiVendor code:string number:string




notices
-editing segments
-editing estimated value
-sort by estimated value
-search projects by mcmc usernames


-add demo inv system
-add article system (commentable)




-Tie into BI table and pull recent orders, flag weird things like armorstarts without source brake option etc etc
