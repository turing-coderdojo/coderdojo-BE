# README

This project is for the Turing mod 4 cross-pollination project. It is a new user registration, login, venue, event, and achievement portal for CoderDojo.

### Versions

- ruby 2.4.1
- rails 5.2.3

### Deployment

Project is deployed at https://pure-castle-14648.herokuapp.com This project has no views and the endpoint described below is the sole access point for this application.

### GraphQL
This API runs on GraphQL. All queries and mutations (DB changes) are made via a POST to "/graphql".

## Available Queries

### allUsers:

This allows the client to retrieve all users from the db and filter their return based on what information is needed/desired.

Available fields: (null property indicates whether null value is allowed to be stored in the DB. There are further requirements built into the mutations below.)
```
field :id, Integer, null: true
field :email, String, null: true
field :username, String, null: false
field :password, String, null: false
field :role, Integer, null: true
field :name, String, null: true
field :notes, String, null: true
field :phone_number, String, null: true
field :guardian_id, UserType, null: true, method: :guardian
field :students, [UserType], null: true, method: :students
field :addresses, [AddressType], null: true, method: :addresses
field :created_at, String, null: false
field :updated_at, String, null: false
```
Query Format:
```
{
  allUsers {
    <Insert desired fields here>
  }
}
```

If querying one of the fields that returns a UserType (guardian_id or students) or AddressType, then you must specify which properties of that user or address you wish to return.

Sample query getting all users with id, name, username, and role, as well as any guardian relationship, or an array of students if the user is a guardian for multiple students.
```
{
  allUsers {
    id
    name
    username
    role
    guardianId{
        name
    }
    students{
        name
    }
  }
}
```

Sample return:
```
{
    "data": {
        "allUsers": [
            {
                "id": 1,
                "name": "Matt Weiss",
                "username": "Duce",
                "role": 1,
                "guardianId": null,
                "students": [
                    {
                        "name": "name"
                    }
                ]
            },
            {
                "id": 10,
                "name": "name",
                "username": "nickynamey2",
                "role": 0,
                "guardianId": {
                    "name": "Matt Weiss"
                },
                "students": []
            }
```

### Me

If this query is sent with a token in the headers of the request `{'Authorization': token}` then the return is any requested information about the currently logged in user. This will likely mostly be for debugging purposes but may prove useful in building out views without storing all information about the user in memory.

Sample query retrieving username and role for current user. Addresses can be retrieved using this query.
```
{
  me{
      username
      role
  }
}
```

Sample return:
```
{
    "data": {
        "me": {
            "id": 1,
            "name": "Matt Weiss"
        }
    }
}
```

### allVenues
  This allows the client to retrieve all venues from the db and filter their return based on what information is needed/desired. For more detail, follow the allUsers example above.

  Sample request:
  ```
{
  allVenues{
    name
  }
}
  ```
  Sample return:
  ```
{
  "data": {
    "allVenues": [
      {
        "name": "Venue One"
      }
    ]
  }
}
  ```

### allVenueAdmins
This allows the client to get all VenueAdmins, but additionally allows for arguments to be passed in the query. We can query for all by using no arguments, or we can query by venue_id or by user_id. This will let us show all admins for a particular venue, as well as all venues that a particular user is admin of. By querying for both a user_id and a venue_id, we can determine if a user is an admin of that venue.

Sample requests/returns:
This query returns all admins for Venue 3
```
{
  allVenueAdmins(venueId: 3){
    user{
      name
    }
  }
}
```
Return:
```
{
  "data": {
    "allVenueAdmins": [
      {
        "user": {
          "name": "Admin Two"
        }
      },
      {
        "user": {
          "name": "Admin Three"
        }
      }
    ]
  }
}
```
This query returns all Venues for that User 3 is admin of
```
{
  allVenueAdmins(userId: 3){
    venue{
      name
    }
  }
}
```
Return:
```
{
  "data": {
    "allVenueAdmins": [
      {
        "venue": {
          "name": "Venue Two"
        }
      },
      {
        "venue": {
          "name": "Venue Three"
        }
      }
    ]
  }
}
```
This query checks whether User 2 is an admin of Venue 1
```
{
  allVenueAdmins(userId: 2, venueId: 1){
    id
  }
}
```
Return:
```
{
  "data": {
    "allVenueAdmins": [
      {
        "id": 1
      }
    ]
  }
}
```
This is what a return will look like if the user and venue do not return a VenueAdmin (this user is not an admin for this venue)
```
{
  "data": {
    "allVenueAdmins": []
  }
}
```
### allEvents
This allows the client to get all Events, but additionally allows for arguments to be passed in the query. We can query for all by using no arguments, or we can query by venue_id.

Sample Request:
```
{
  allEvents(venueId: 2){
    id
    name
  }
}
```
Return:
```
{
  "data": {
    "allEvents": [
      {
        "id": 1,
        "name": "Test Event"
      },
      {
        "id": 7,
        "name": "New Event"
      },
      {
        "id": 8,
        "name": "New Event"
      }
    ]
  }
}
```

To get all events, simply make this request without arguments.

### Attendance
This query is similar to VenueAdmins in that you can pass a variety of arguments to retrieve the desired data set.
- Querying for both a userId and EventId will tell us if a particular student was at a particular event.
- Querying only the eventId will show all students that attended the event.
- Querying only a userId will show us all events that a student has attended

Sample Request:
```
{
  attendance(userId:6){
    event{
      name
    }
  }
}
```
Sample Response:
```
{
  "data": {
    "attendance": [
      {
        "event": {
          "name": "Test Event 1"
        }
      },
      {
        "event": {
          "name": "Test Event 2"
        }
      },
      {
        "event": {
          "name": "Test Event 3"
        }
      }
    ]
  }
}
```
## Available Mutations

### createUser
This allows the client to create a guardian user and store it to the db and filter their return based on what information is needed/desired. This also creates an entry in the addresses table linked to the user.

Fields: Note that the only field not required is `street_2`.

User args:
```
argument :email, String, required: true
argument :username, String, required: true
argument :password, String, required: true
argument :name, String, required: true
argument :phone_number, String, required: true
```
Address args:
```
argument :street1, String, required: true
argument :street2, String, required: false
argument :city, String, required: true
argument :state, String, required: true
argument :zip, String, required: true
```

Sample request: Note that the bang `!` on the variables indicates that they are required.
This request will also return the id after user is created, but any user field can be returned here.
```
mutation createUser(
    $email: String!,
    $username: String!,
    $password: String!,
    $name: String!,
    $phoneNumber: String!,
    $street1: String!,
    $street2: String,
    $city: String!,
    $state: String!,
    $zip: String!
    ) {
    createUser(
    email: $email,
    username: $username,
    password: $password,
    name: $name,
    phone_number: $phoneNumber,
    street1: $street1,
    city: $city,
    state: $state,
    zip: $zip
  ) {
    id
  }
}
```

Sample return:
```
{
    "data": {
        "createUser": {
            "id": 4
        }
    }
}
```

### createStudent
This allows the client to create a student user and store it to the db and filter their return based on what information is needed/desired.

If token is passed to this mutation in the headers of the request, student is created linked to the guardian registering them.

If no token is passed, then student is being registered from the "over 13" form and no guardian link is established.

Fields/Args:
```
argument :username, String, required: true
argument :password, String, required: true
argument :name, String, required: true
argument :birthdate, String, required: true
```

Sample request:
```
mutation createStudent(
    $username: String!,
    $password: String!,
    $name: String!,
    $birthdate: String!    
    ) {
    createStudent(
    username: $username,
    password: $password,
    name: $name,
    birthdate: $birthdate
  ) {
    id
  }
}
```

Sample return:
```
{
    "data": {
        "createStudent": {
            "id": 4
        }
    }
}
```

### createVenue
This allows a superuser to create a venue.

Token required. Operation will return an error message if no token or if current user is not a superuser.

Args:
```
#Venue args
argument :name, String, required: true
argument :email, String, required: false
argument :notes, String, required: false
argument :web_url, String, required: false
argument :photo_url, String, required: false

#Address args
argument :street_1, String, required: true
argument :street_2, String, required: false
argument :city, String, required: true
argument :state, String, required: true
argument :zip, String, required: true
```

Sample request:
```
mutation createVenue(
    $name: String!,
    $street1: String!,
    $street2: String,
    $city: String!,
    $state: String!,
    $zip: String!
    ) {
    createVenue(
    name: $name,
    street1: $street1,
    street2: $street2,
    city: $city,
    state: $state,
    zip: $zip
  ) {
    id
  }
}
```
Sample Return:
```
{
    "data": {
        "createVenue": {
            "id": 3
        }
    }
}
```

### signIn
This allows a user to sign in with their username and password. This mutation generates and returns a token to be sent in request headers for any query or mutation where authorization is required.

Fields/Args:
```
argument :username, String, required: true
argument :password, String, required: true
```

Sample request: This request returns the token and the user id. If only the token is desired, simply remove the user and id from the request.
```
mutation signIn(
    $username: String!,
    $password: String!    
    ) {
    signIn(
    username: $username,
    password: $password
  ) {
    token
    user{
      id
    }
  }
}
```

Sample return:
```
{
    "data": {
        "signIn": {
            "token": "RHVjZQ==\n"
        }
    }
}
```

### createVenueAdmin
This allows a superuser or current venue admin to create a VenueAdmin.

Token required. Operation will return an error message if no token or if current user is not a superuser or VenueAdmin.

Must pass in id of user to be promoted to admin and id of venue.

Sample Request:
```
mutation{
  createVenueAdmin(
    userId: "5",
    venueId: "2"
  ){
    id
  }
}
```

### createEvent
This allows a superuser or current venue admin to create an Event.

Token required. Operation will return an error message if no token or if current user is not a superuser or VenueAdmin.

Note that the address fields are optional.

Fields/Args:
```
#Event args
argument :name, String, required: true
argument :notes, String, required: false
argument :start_time, String, required: true
argument :end_time, String, required: true
argument :venue_id, Integer, required: true
#Address args
argument :street_1, String, required: false
argument :street_2, String, required: false
argument :city, String, required: false
argument :state, String, required: false
argument :zip, String, required: false
```

Sample Request:
```
mutation{
  createEvent(
    name: "New Event",
    venueId: 2,
    startTime: "2019-07-21 08:30:00",
    endTime: "2019-07-21 10:30:00"){
   id
  }
}
```

### logAttendance
This allows a student user to have their attendance logged when request is made with a valid event_id and event_code.  

Token required. will error if current user role is anything other than student or if student has already had their attendance counted for this event.

Sample Request:
```
mutation{
  logAttendance(eventId: 4, eventCode:"8783ba89"){
    id
  }
}
```
