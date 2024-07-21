# vixted_api

<!-- Project Title -->
## vixted_api project

<!-- Project Description -->
A simple API built with Ruby on Rails to demonstrate basic CRUD operations. This project showcases my **current** knowledge in creating RESTful APIs with Rails, including setting up routes, controllers, and models, as well as handling JSON responses and app testing.

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Getting Started](#getting-started)
   - [Prerequisites](#prerequisites)
   - [Installation](#installation)
   - [Running the Server](#running-the-server)
   - [Running Tests](#running-tests)
4. [API Endpoints](#api-endpoints)
5. [Technologies Used](#technologies-used)
6. [Contributing](#contributing)
7. [License](#license)
8. [Contact](#contact)

<!-- Introduction to the Project -->
## Introduction

This project is designed to provide a basic understanding of how to create a RESTful API using Ruby on Rails. It includes endpoints for creating, reading, updating, and deleting resources.

<!-- Features of the Project -->
## Features

- RESTful API endpoints for CRUD operations
- JSON responses
- Basic authentication (JWT)
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

List of available API endpoints:

Item Endpoints
* `GET /items` - List all item
* `GET /items/:id` - Get a specific item
* `POST /items` - Create a new item
* `PUT /items/:id` - Update a specific item
* `DELETE /items/:id` - Delete a specific item

#### Example Request and Response

## Technologies Used

* Ruby on Rails
* MySQL
* Postman (for API testing)
* factory_bot (for testing)
