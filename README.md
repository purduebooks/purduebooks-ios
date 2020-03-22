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

* Login / Registration
* User Listing (based on course information)
* Photo Upload
* Textbook search via course name
* Price & Semester Filtering

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
[Add picture of your hand sketched wireframes in this section]
<img src="https://raw.githubusercontent.com/purduebooks/purduebooks-ios/master/wireframe.jpg" width=600>

### [BONUS] Digital Wireframes & Mockups
<img src="https://raw.githubusercontent.com/purduebooks/purduebooks-ios/master/wireframe-digital.jpeg" width=600>

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
