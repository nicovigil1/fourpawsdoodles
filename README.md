# Four Paws Doodles

A site designed for a GoldenDoodle breeder. It enables them to label the breed of both parents as well as record the breed of a litter. Within each litter a puppy is labeled by gender, breed, and availability - all managed from the admin dashboard. This dashboard can also control which puppies are available to the site's visitors. Future iterations include pre-generated litter breeds based off parental genetics as well as the ability for visitors to log in through Facebook Oauth & and list their puppy preferences (for puppy visitation day).

## Getting Started

Clone down the repo cd into the directory, bundle, and run `rake db:{create,migrate,seed}`. Following this run `rails s` and open localhost:3000.

### Prerequisites

All dependencies should be covered by a simple `bundle install`.

## Running the tests

RSpec was used as a testing suite. In order to run tests ( after having bundled ), cd into the directory & run `rspec`.

### Break down into end to end tests

Tests cover basic functionality - test completeness is marginal as this was started as a side project to better understand Rails. The MVP will include 98%+ testing. 

## Built With

* [Ruby on Rails](https://rubyonrails.org/) - The web framework used

# Screenshots ( styling still in progress )

## Homepage
<img width="1440" alt="Screen Shot 2019-03-11 at 7 26 32 PM" src="https://user-images.githubusercontent.com/43397150/54168873-3c2cc300-4436-11e9-9706-5d138e5f0c16.png">

## Admin Puppy Index Page
<img width="1439" alt="Screen Shot 2019-03-11 at 7 57 27 PM" src="https://user-images.githubusercontent.com/43397150/54169360-f7a22700-4437-11e9-8fb1-be4c26f4b09b.png">

## Admin Parent Index Page
<img width="1438" alt="Screen Shot 2019-03-11 at 7 56 58 PM" src="https://user-images.githubusercontent.com/43397150/54169324-dd684900-4437-11e9-8cfb-baf6b20235e2.png">

## Admin Parent Show Page
<img width="1439" alt="Screen Shot 2019-03-11 at 7 58 48 PM" src="https://user-images.githubusercontent.com/43397150/54169379-1accd680-4438-11e9-957d-cb4630d60dc7.png">

## Admin Litter Index Page
<img width="1436" alt="Screen Shot 2019-03-11 at 7 53 28 PM" src="https://user-images.githubusercontent.com/43397150/54169207-603cd400-4437-11e9-8756-2229a371ecea.png">

## Admin Litter Show Page
<img width="1438" alt="Screen Shot 2019-03-11 at 7 54 08 PM" src="https://user-images.githubusercontent.com/43397150/54169232-75196780-4437-11e9-9e8e-8646ec9067be.png">

## Admin Litter Creation Page
<img width="1437" alt="Screen Shot 2019-03-11 at 7 55 06 PM" src="https://user-images.githubusercontent.com/43397150/54169266-98dcad80-4437-11e9-8ce7-da144dfe8f8f.png">

# Open Issues:

## First Things First - Styling needs to be completed.

### Genetics
There needs to be a way to automatically calculate the breed based off of the parents' breed - for later.

### Puppies
- Make it so that there is a default image for all puppers as well as a way to upload your own. - post production / pre-styling?

- Make it so that puppies are named "boy 1" "boy 2" (or girl a, girl b, girl c..) - maybe make it so that it goes off a count of the amount of puppies in that litter?

### Design
- the puppers index page should be grouped by mother's then by father's in their own cards/segments 

- previously placed puppies page - just an image of the puppy

### Litter Show Page
- have a column for when the litter becomes available
    - need to edit the puppies to only be the ones that are unsold
    - this will also be the place where you can see each of the pupper's pictures. - the litter index will just be cards 



### Dog Training Page
pricing cards for easy updates


### Available Puppies

- updated on
- make it so that an image can be enlarged

### Upcoming Litters

- migrate a status for litter that can be upcoming or born - with an anticipated birthdate associated with it

#### Validation tests needed for all models

#### Needs CRUD - create functionality for puppies
#### Test create functionality for litters - works on localhost
