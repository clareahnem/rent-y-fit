# RENT-Y-FiT: A Ruby on Rails Marketplace Application
---
#### Link to RENT-Y-FiT: 

https://rent-y-fit.herokuapp.com/ 

---
## What is RENT-Y-FiT? (Problems and Purpose)
RENT-Y-FiT (short for Rent-Your-Outfit) is a marketplace web application where Melbournians streetwear lovers can can exchange items in their wardrobes. This application was created in 3 weeks for a project at Coder Academy using Ruby on Rails, therefore is not for a running business.

We all know by now that fast fashion [impacts our environment](https://www.sustainyourstyle.org/old-environmental-impacts) in so many aspects - toxic wastewaters are released to rivers and oceans, textile fibres are dumped and comsumed by wildlife, and production and transportation of apparel items cost tons of energy. However, fashion as a form of self expression is definitely not something that should be compromised. We still want to wear what we like, stay on trend, and we don't want to feel guilty doing so either!
There is of course, an option to buy and resell your items as second hand, but there are sometimes some problems;

- Personal and social trends come and go, and sometimes it's wasteful to buy fashion items only to wear it for a season.
- Second hand clothing doesn't have the items you are looking for
- Luxury brands are still super expensive (if not more expensive than retail price) to purchase second hand
- You have items that are just sitting in your closet, but you "might still want to wear it one day" so you don't have the heart to donate or resell them just yet.

One solution to combat these issues is to, instead of buying or selling apparel items, rent them between one another. That is, you are simply borrowing each other's clothes for a few days to few weeks. When the renting period ends, the item is simply returned back to the owner. This way we reduce the chance of discarding fashion items, and the items can be loved by the entire community!

An example of this type of business do already exist, including [The Volve](https://www.thevolte.com/) which allow both companies and individuals to list items for rent. However, most web applications like this exist for dress hires or women's fashion. That is why I have created RENT-Y-FiT, which aims to create a platform where streetwear items for both men and women are shared. Streetwears are widely popular fashion style for everyday wear, but these items can get quite expensive. With RENT-Y-FiT, anyone can enjoy a fire outfit without sacrificing their wallet. 

## Target Audience
RENT-Y-FiT is created for any adults living in Victoria, Australia who loves streetwear fashion. User must be responsible enough to respect other users and handle all FiTs with care. It is particularly suited for those who want to wear various different outfits but don't have the luxury of buying apparel items frequently. It is a great tool to make pocket money off of items you already have in your closet, hence is likely that young adults would enjoy using this application in particular. 

## Functionality and Features
RENT-Y-FiT is composed of the following main functionalities;
#### 1. Uploading Items (a.k.a FiTs)

The main functionality of this application is the exchange of clothing and accessory items. Users are able to upload an item they would like to rent out by providing its name, description, the brand/s, category of the item and the price they would rent per day. They can also assign a deposit to the item for potential loss or damage. An image can be attached to an item, which will be displayed for all users to see. Images utilises active storage and are stored in a AWS S3 bucket cloud service. A single item can be a bundle pf items such as 5 pieces of tshirts for the season, an entire outfit from head to toe or a collection of accessories. For this reason, item's category includes `bundles` and brands are checkboxes so user can pick multiple brands. Users will have access to a page where all FiTs that are available to rent is shown. Even if you are not sure about signing up, you can browse through this page to see if there are any FiTs that you are keen to rent.


#### 2. Requesting to Rent FiTs.

All of the available items listed by existing users can be viewed through "View FiTs" page. Each item is displayed in a card format with an image, name of the item and the price rate per day. If an item is listed by you, you will also see a button to make the item unavailable, which will hide the item from the "View Fits" page.  When you find an item that you want to rent, you can click on "View FiT" button to see the full description, choose the day you want to start renting, how many days you would like to rent the item and then send a rent request to the owner of the item. 

Booking(rent) requests can only be sent if a user is signed in. If user is not signed in, they will see a button to Log In instead of the booking requests form. The request form will also not be rendered in cases where the user is the owner of the item being shown. Instead, there will be buttons available for the user to edit or delete the item.

#### 3. As the Owner of the item receiving rent request

If a FiT you have uploaded receives a rent request, you have the ability to either accept or decline the request. This functionality is available in the user dashboard page, which contains all information about FiTs that you own. Response to rent request will be sent back to the requesting user. If you approve the booking request, the requesting user will be able to proceed to payment to confirm the order. Once the requesting user pays for the deal, the booking status will change and the booking card will appear under confirmed bookings in your dashboard. Confirmed orders are further divided into 3 sections depending on whether the order is upcoming, currently active or completed. In any of these 3 sections, you will be able to see a "Order details" button, which will direct you to an order summary page with address that the item should be sent to, who the requesting user is and directions and suggestions on how to send out your item.


#### 4. Confirming Rent Order with payment as user requesting to rent

If you request to rent a FiT, you can view updates on the status of your book requests in the Cart Summary page. Bookings will be grouped according to its booking status, which are `pending`,`approved`, `declined` or `paid`. Prior to making payment, you are able to delete the booking request by clicking on "Delete booking request". If your booking request has been approved by the owner, you can confirm your rent by making a payment. You will have to pay the deposit and the price of rent according to how many days you will be renting. Payment can be made by card and this functionality is implemented using Stripe API. 
The item's booking page will have the total price summarised for you so you can proceed to order knowing how much you will need to pay. By clicking on "Proceed to Order" button you will be directed to the Stripe card payment page. 

Once the payment is successfully made you will be redirected to a payment success page, which means that your rent for the FiT is officially confirmed. Here you will see a confirmation message and link for the order as well as your address that the order is being sent to. You will also be able to view the Order summary from the cart summary page at any time by clicking on the item's "Order Details" button. Order summary will show you the link to your receipt, the address your item will be sent to by which user and care instructions on how to responsibly handle the item you are renting.

---
## Tech Stack: 

#### Planning
- Trello
- Balsamiq Wireframes
- Draw.io for drawing sitemaps and ERD

#### Version control
- Git 
- GitHub

#### Gems, APIs and Other services
- Rails
    - Software used to build application
- Devise
    - User authorisation
- Bootstrap
    - styling visual components
- Google Fonts
- AWS S3 bucket
    - Image storage
- Ultrahook
    - local endpoints to connect to stripe
- Stripe
    - card payment API
- Active Storage
    - Image storage
- Heroku
    - deployment
- Nested_forms
    - gem for nested forms
- validates_timeliness
    - gem for validating date and time data-types
- Rspec for testing
    - Factory Bot
    - Database Cleaner

#### Languages
- HTML
- SCSS
- JavaScript
- Ruby

## Use of third party services
#### 1. AWS S3 Bucket

To store images that are uploaded by different users of the application, I have integrated the Amazon Web Service cloud storage S3 bucket. If we were to save all of the images that users attach to their items locally, the memory space of the application will rapidly increase, making the application more costly in terms of hosting and loading time. S3 buckets store uploaded files in a cloud environment in your region and provides security by encrypting download and upload processes, so that the application can safely and quickly push and pull objects to the bucket. 

#### 2. Stripe 

To enable card transactions for renting procedures, I have implemented the Stripe api. Stripe creates a payment session for each transaction and returns an output such as payment receipt and id. Storing sensitive information such as a card number in our database can be extremely dangerous as databases are not secure enough to guarantee that these information would not be accessible to anyone other than the card owner themselves. By creating a stripe checkout session and have the api return certain values for successful payment transaction the database will only hold minimum pieces of information that is required to run the application without errors, whilst providing safety for the users. To test that the stripe session work wihtout issues, **ultrahook** was used alongside stripe to create a webhook for times when the application was running on localhost.

#### 3. Devise

To restrict some features of the application to only authorised users, I have implemented Devise to create user registration and login pages. Sensitive information such as user's emails and addresses must be protected so that each user can only access or view information regarding themselves. Devise is a secure third party application software that implements user authorisation through sessions. It ensures that passwords are heavily encrypted to prevent data breaches. it also provides rails with useful helper methods including `authenticate_user!` that can prevent unauthorised user from loading certain pages.  

#### 4. Bootstrap

Bootstrap was implemented in this application to assist with the visual styling of the application. Complex structures such as the navigation bar and grid layouts were implemented using bootstrap class names. It allowed for the MVP of the application to be built without putting much effort and time into css/scss, overall increasing the efficiency of application production process.

---

## Models and Associations
An **Address** model contains information about the postal address of a user. All fields are mandatory hence cannot be left as nil. We Further validate the postcode as RENT-Y-FiT services are currently only available to those in Victoria, Australia. 
- **Address** has a one to one association with **User**, where User has one address and an address belongs to a user. Addresss table contains the foreign key `user_id` which directly points to a user in a user's table.

A **User** model is created using devise and contains user's information about their emails and passwords necessary for authentication, as well as names and usernames for easier identification and improved UI/UX. Username is a mandatory field as they are used as an identifier in our application views to show who the owner of the item is, who requested to rent an item and more. User's email and passwords are also mandatory fields as they are a vital piece of information for user authentication.
- **User** has a one to many relationshio with **Item**, where User has many items and an item belongs to a user, referenced by the `user_id` foreign key.
- **User** has a one to many relationship with **Booking**, where user can create many bookings and a booking belongs to a `requesting_user`, a foreign key referencing a user.

**Category** model holds name of an item's category such as "Jackets", and "Hats".
- **Category** has a many to one relationship with **Item**, where a category has many items and an item belongs to a category through `category_id` foreign key.

**Items** table contains key information about the FiT being listed, including its `name`, `price_per_day`, `availability` and `deposit` amount. The `name` of the item, the `availability` and the `price_per_day` are mandatory fields as they are all required for associated entities such as p`rice_per_day` for orders and `availability` for bookings. `Condition` is an enum where each integer represents a condition such as "Distressed" or "Excellent" to indicate the quality of the item. `description` is a text field where user can describe the item in detail including features such as sizings and graphics. `availability` of the item defaults to true when it is initially created. This can be switched on and off by the owner of the item through their dashboard page.  
- **Item** and **Brand** have a many to many association through a join table **Items_brand**, where an items_brand contains a row with a single item and one or more brands. A single brand can contain zero or more items through an items-brands table. Since items can be no branded, it is not mandatory that an item lists a brand.
- **Item** and **Booking** has a one to many relationship, where an item can have multiple bookings created, and a single booking will reference a particular item through an `item_id` foreign key.
- **Item** can have multiple **Orders** through a **Booking**. A single instance of an Order will reference a single Item, therefore Item and Order models have a one to many relationship.
- Each **Item** can have a single `picture` attached through Active storage. An Active Storage attachment belongs to an active storage blob in a one to one relationship.

**Bookings** table can be created when a user wishes to rent a FiT. It holds information on which days this user would like to rent the item and the current status of the booking such as "approved" or "pending". All fields in the Bookings table are mandatory as it forms the basis of an order. Booking must identify who is requesting through a `requesting_user` foreign key, and for which item referenced with `item_id` foreign key. 
- **Booking** can have zero or one **Order**, forming a one to one relationship. A Booking can only create an order when booking status is "approved". Orders table will hold information such as the `payment_id` and the `receipt_url` to the transaction receipt, vital to prove a successful transaction. Order model contains a foreign key `booking_id` to refer to a specific item's booking.
