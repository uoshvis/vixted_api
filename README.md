# vixted_api

<!-- Project Title -->
## vixted_api project

<!-- Project Description -->
A simple API built with Ruby on Rails to demonstrate basic CRUD operations. This project showcases my **current** knowledge in creating RESTful APIs with Ruby on Rails, including setting up routes, controllers, and models, as well as handling JSON responses and app testing.

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Getting Started](#getting-started)
   - [Prerequisites](#prerequisites)
   - [Installation](#installation)
   - [Running the Server](#running-the-server)
   - [Running Tests](#running-tests)
4. [API Endpoints](#api-endpoints)
   - [Live Server](#live-server)
   - [Example Request and Response](#example-request-and-response)
5. [Technologies Used](#technologies-used)
7. [License](#license)
8. [Contact](#contact)

<!-- Introduction to the Project -->
## Introduction

This project is designed to provide a basic understanding of how to create a RESTful API using Ruby on Rails. It includes endpoints for creating, reading, updating, and deleting resources.

<!-- Features of the Project -->
## Features

- RESTful API endpoints for CRUD operations
- JSON responses
- Basic authentication (JWT) and authorization
- Error handling and validation
- Testing

<!-- Getting Started Section -->
## Getting Started

Follow these instructions to set up the project on your local machine.

### Prerequisites

- Ruby (version 3.3.3)
- Rails (version 7.1.3)
- MySQL (or another preferred database)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/uoshvis/vixted_api.git

2. Navigate to the project directory:
   ```bash
   cd vixted_api

3. Install dependencies:
    ```bash
   bundle install

4. Export MySQL password:
    ```bash
   export DB_PASS="your_password"

5. Install dependencies:
    ```bash
   rails db:create db:migrate

### Running the Server

```
rails server
```

### Running Tests

```
rails test
```

## API endpoints

| Prefix               | Verb   | URI Pattern                                 | Controller#Action       |
|----------------------|--------|---------------------------------------------|-------------------------|
| api_v1_user_items    | GET    | /api/v1/users/:user_id/items(.:format)      | api/v1/items#index      |
| api_v1_user_item     | GET    | /api/v1/users/:user_id/items/:id(.:format)  | api/v1/items#show       |
| api_v1_users         | GET    | /api/v1/users(.:format)                     | api/v1/users#index      |
| api_v1_users         | POST   | /api/v1/users(.:format)                     | api/v1/users#create     |
| api_v1_user          | GET    | /api/v1/users/:id(.:format)                 | api/v1/users#show       |
| api_v1_user          | DELETE | /api/v1/users/:id(.:format)                 | api/v1/users#destroy    |
| search_api_v1_items  | GET    | /api/v1/items/search(.:format)              | api/v1/items#search     |
| api_v1_items         | GET    | /api/v1/items(.:format)                     | api/v1/items#index      |
| api_v1_items         | POST   | /api/v1/items(.:format)                     | api/v1/items#create     |
| api_v1_item          | GET    | /api/v1/items/:id(.:format)                 | api/v1/items#show       |
| api_v1_item          | PATCH  | /api/v1/items/:id(.:format)                 | api/v1/items#update     |
| api_v1_item          | PUT    | /api/v1/items/:id(.:format)                 | api/v1/items#update     |
| api_v1_item          | DELETE | /api/v1/items/:id(.:format)                 | api/v1/items#destroy    |
| api_v1_me            | GET    | /api/v1/me(.:format)                        | api/v1/users#me         |
| api_v1_auth_login    | POST   | /api/v1/auth/login(.:format)                | api/v1/auth#login       |

### Live Server

[https://vixted-api.onrender.com/api/v1/items](https://vixted-api.onrender.com/api/v1/items)

To use live version:

1. Create user.
2. Get token.
3. Use token for CRUD.

### Example Request and Response

Request

```
POST /api/v1/items HTTP/1.1
Host: example.com
Authorization: Bearer YOUR_ACCESS_TOKEN
Content-Type: application/json

{
  "title": "Sample Item",
  "description": "This is a sample description.",
  "price": 19.99,
}
```
Response 

```
HTTP/1.1 201 Created
Content-Type: application/json
Location: /api/v1/items/1

{
  "id": 1,
  "title": "Sample Item",
  "description": "This is a sample description.",
  "price": 19.99,
  "user": {
    "id": 1,
    "username": "user1"
   }
}
```

## Technologies Used

* Ruby on Rails
* MySQL
* Postman (for API testing)
* factory_bot (for testing)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

**GitHub:** [uoshvis](https://github.com/uoshvis)