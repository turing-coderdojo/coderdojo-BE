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
