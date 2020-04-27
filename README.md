Group Project - README
===

# PurdueBooks

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This will be a simple app that allows Purdue students to sell their college books to other Purdue students easily.

### App Evaluation
- **Category:** Education / E-commerce
- **Mobile:** iOS (current) / Android (planned)
- **Story:** Buying books is always expensive and it is hard to find students with the same books. Additionally, selling it on online platforms yields little buyer reach and high commisions. We want to simplify that market and create a simple way for students to fulfill their course textbooks requirement.
- **Market:** College students at Purdue. We will plan to expand this to other college campuses once this proof of concept has been validated.
- **Habit:** We hope that our product is the first application students use in the beginning of the semester to buy/sell books. There are 2 types of users -  buyers and sellers. The buyers would spend more time on the app looking for good deals on their textbooks. The sellers would use the app once in order to sell the textbook.
- **Scope:** This current version will allow the sellers to sign in and post their textbooks online. Buyers can view the textbooks in the respective categories and contact the seller. Then, we will evaluate further expansion. This can be extended to any closed market (such as a college campus) where students live in close proximity, and have similar textbook requirements.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* [x] Login / Registration
* [x] User Listing (based on course information)
* [x] Photo Upload
* [x] Textbook search via course name
* [x] Filtering

**Optional Nice-to-have Stories**

* Buyer/Seller Reviews
* User Validation
* In-App Messaging

### 2. Screen Archetypes

* Login/Registration
   * Courses View
       * Filter by Price, Semester taken
* List Book
* Click on Book
    * Send Book Request
        * Seller will accept
            * Seller's contact info is sent to buyer
* My Listings
    * Edit/Delete Listing
    * Manage Requests
* Profile
    * Manage name, phone number
    * Create/Remove/Update/Delete Current Courses

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Available Books
* My Listings
* Messaging
* Profile / User Settings / My Listings

**Flow Navigation** (Screen to Screen)

* Login / Register
    * Available Book Listings
* Book detail
    * Contact Seller Info
    * Detailed information of the Book

## Wireframes
<img src="https://raw.githubusercontent.com/purduebooks/purduebooks-ios/master/wireframe.jpg" width=600>

### [BONUS] Digital Wireframes & Mockups
<img src="https://raw.githubusercontent.com/purduebooks/purduebooks-ios/master/wireframe-digital.jpeg" width=600>

## Schema 
### Models
#### BookPost

   | Textbooks      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user book post (default field) |
   | Name          | String   | name of the book |
   | Author        | Pointer to User| book seller |
   | buyers        | Pointer to User Array | book buyer |
   | image         | File     | image that user posts |
   | location         | Location     | current location of the book |
   | description       | String   | description of book (professor, edition, etc) |
   | CouseNumber | String   | course Name/Number (eg. CS 250) |
   | Course | String   | course Name (eg. Computer Architecture) |
   | createdAt     | DateTime | date when post is created (default field) |
   
#### User

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | userId      | String   | unique id for the user (default field) |
   | fname        | Pointer to User| first name of user |
   | lname        | Pointer to User Array | last name of user |
   | email         | File     | e-mail of User |
   | phNumber       | Integer   | phone number of user |
   | dob       | DateTime   | date of birth of user |
   
### Networking
#### List of network requests by screen
   - Home Feed Screen
      - (Read/GET) Query all posts where user is not seller
         ```swift
         let query = PFQuery(className:"Post")
         query.whereKey("author", notEqualTo: currentUser)
         query.order(byDescending: "createdAt")
         query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let posts = posts {
               print("Successfully retrieved \(posts.count) posts.")
           // TODO: Do something with posts...
            }
         }
         ```
   - Create/Manage Book Post Screen
      - (Create/POST) Create a new post
      - (Update) Edit existing post
      - (GET) View existing posts
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update User First/Last Name
      - (Update/PUT) Update User E-Mail
      - (Update/PUT) Update User Phone Number
   - Login / Register
      - (GET) Log in with credentials and see if user/password combo is valid
      - (POST) Register new account

## Milestone GIFs

### Milestone 1
<img src='https://github.com/purduebooks/purduebooks-ios/blob/master/PurdueBooks_Milestone1.gif?raw=true' title='Video Walkthrough' width='' alt='Video Walkthrough' />

### Milestone 2
<img src='https://github.com/purduebooks/purduebooks-ios/blob/master/PurdueBooks_Milestone2.gif?raw=true' title='Video Walkthrough' width='' alt='Video Walkthrough' />

### Milestone 3
<img src='https://github.com/purduebooks/purduebooks-ios/blob/master/PurdueBooks_Milestone3.gif?raw=true' title='Video Walkthrough' width='' alt='Video Walkthrough' />

### Milestone 4
<img src='https://github.com/purduebooks/purduebooks-ios/blob/master/PurdueBooks_Milestone4.gif?raw=true' title='Video Walkthrough' width='' alt='Video Walkthrough' />
