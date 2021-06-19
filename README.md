# README

# An Art Share API
Note: columns `created_at` and `updated_at` 
is omitted in this doc for simplicity. Data is returned as JSON format.

Routes:

### Return all users: GET localhost:3000/users
```
[
  {
    "id": 1,
    "name": "robert",
  },
  {
    "id": 2,
    "name": "bill",
  }
]
```

### Create a new user: POST localhost:3000/users. Data is sent in x-www-form-urlencoded form.
| field | type |
|-------|-------|
| name  | string |

### Get an user: GET localhost:3000/users/:id.
Example: GET localhost:3000/users/1.
```
[
  {
    "id": 1,
    "name": "robert",
  }
]
```

### Update a user: PATCH localhost:3000/users/:id. Data in x-www-urlencoded form.
Example: PATCH localhost:3000/users/1.
| field | type |
|-------|-------|
| name  | string |

### Delete a user: DELETE localhost:3000/users/:id.
Example: DELETE localhost:3000/users/1.
Expect status 200 with the deleted user returned.

### Get owned_artworks and shared_artworks: GET localhost:3000/users/:id/artworks
Example: GET localhost:3000/users/1/artworks
```
{
  "owned_artworks": [
    {
      "id": 1,
      "title": "nighthawks",
      "image_url": "google.com",
      "artist_id": 1,
      "favorite": false
    }
  ],
  "shared_artworks": [
    {
      "id": 3,
      "title": "elf castle",
      "image_url": "google3.com",
      "artist_id": 2,
      "favorite": false
    }
  ]
}
```

### Create an artwork: POST localhost:3000/users/:id/artworks. Data in x-www-urlencoded form.
Example: POST localhost:3000/users/1/artworks.
| field               | type |
| title               | string |
| image_url           | string |
| favorite (optional) | boolean |

Status code 200 is returned as well as the artwork object with `artist_id`
with the value of id from the URL route.

### Get an artwork: GET localhost:3000/users/:user_id/artworks/:id.
Example: GET localhost:3000/users/1/artworks/1.
```
{
  "id": 1,
  "title": "nighthawks",
  "image_url": "google.com",
  "artist_id": 1,
  "favorite": false
}
```

### Update an artwork: PATCH localhost:3000/users/:user_id/artworks/:id
Example: PATCH localhost:3000/users/1/artworks/4
| field | type |
| title (optional) | string |
| image_url (optional) | string |
| favorite (optional) | boolean|

### Delete an artwork: DELETE localhost:3000/users/:user_id/artworks/:id
Destroyed artwork is expected to be returned. Status code 200.

## Artwork Shares - Join table for M:M relationship between an user and a shared artwork.

### Create an artwork share: POST localhost:3000/artwork_shares
Status code 200 is expected as well as the created new artwork_share record.
| field | type |
| artwork_id | integer |
| viewer_id | |integer |
| favorite | boolean |

### Delete an artwork share: DELETE localhost:3000/:id
Expect the artwork_share object to be returned with status code 200.



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
