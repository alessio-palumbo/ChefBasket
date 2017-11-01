# ChefBasket

### Problem
Ordering goods is a chef daily routine and a task that can be daunting, not only because of the calculations and estimates involved in placing an order, but also because each supplier has got its own ordering system. (sms, email, webapp, voicemail)
The problem resulting by this are:
- Time wasted using multiple systems and keeping track of numbers, emails 
- No records of orders/transactions
- Easy to make mistakes (typos, sending message to the wrong suppliers, etc)
- No confirmation of order received
- No estimate on current order or data in general
- Supplier invoice either printed out or sent by email (two different places, easy to lose)
-  


### Solution
By providing a common portal, restaurants and suppliers can simplify they way they do business and at the same time collect data from orders and transactions to help them make better decisions.
#### The advantages for the restaurants are: 
- A single ordering system for all their suppliers
- Orders cost and history for comparisons (optional weekly estimates and target)
- Real time deals on products (notification on price drops) 
- Order/payments confirmations (option to pay weekly on the following Monday)
- Direct messaging to the supplier (with sms and email notification to supplier)
- Search supplier/item from the database
#### The advantages for the suppliers are:
- Invoicing through the system
- List of restaurants to send offers to
- Compare prices with competitors
- Be notified of new order/ restaurant message
- Holiday notifications/ Discounts through system

### User Restaurant
#### Home
#### Suppliers
- List of my suppliers
- Search supplier 
#### Supplier/Orders
- Order history (paid/unpaid/due)
- New order
- Message Supplier
#### Supplier/:Order/Payment






### Restaurant
- details
- check suppliers in the system
- check supplier database
- look up for an item in database
- order certain quantities of an item
- place order
- message supplier
- pay supplier
- get confirmation when order is placed
- weekly audit
- transaction history (both goods and payments) 

### Supplier
- upload database (option to label item as out of stock)
- apply discounts
- message restaurants (for deals or out of stock)
- notification of payment from restaurant
- give a credit to restaurant (for returned item or else)


###Problems Encountered
The first problem I had to deal with was to decide how to structure the user model since this application is serving two different user with opposite situations and needs.
- One way was to build two different user with devise
- Another way was to create a sigle User model with polymorphic profile that contains the unique filed needed for the user type
- A different approach to the previous solution was to create a single User model with a polymorphic authenticable property. 
- Single table inheritance
