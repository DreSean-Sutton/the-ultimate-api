# the-ultimate-api

A full stack web application for Smash Ultimate loving devs who want to incorporate raw stats into their own applications.

## Why build this?

Smash Ultimate is an excellent contender for my favorite game, so I made a [frame data viewing app](https://dresean-sutton.github.io/smashmate/) for it. I pulled my data from the best Smash API on the market, the [KuroganeHammer API](https://github.com/Frannsoft/FrannHammer). However, it is outdated and unmaintained for Smash Ultimate. In an effort to fill the gap for me and other developers, I decided to build my own RESTful API and give back to the Smash community.

## Live Demo and API documentation

Test out my endpoints here at: https://the-ultimate-api.herokuapp.com/

## Technologies Used

- HTML5
- JavaScript (es5/es6)
- Node.js
- express.js
- postgreSQL
- YAML
- yamljs
- Swagger-ui-express
- openapi
- dotenv
- shell
- Heroku

## Features

- User can receive an array of json objects that include all Fighters and their basic information.
- User can receive an array of json objects that include all Fighters and their data.
- User can choose to only receive one type of data from all Fighters (moves, throws, movements, or stats).
- User can use specify a single fighter in the three previous features by using `fighterId`, `fighter`, or `rosterId` as query parameters.
- User can use the `orderByRosterId=true` query parameter to order the list based on rosterId instead of alphanumeric.
- User can `add` Fighters and their basic information to the database.
- User can `add` moves, throws, movements, and stat type data to any existing Fighters.
- User can `update` Fighters and their basic information in the database.
- User can `update` moves, throws, movements, and stat type data on any existing Fighters.
- User can `delete` Fighters and their basic information from the database.
- User can `delete` moves, throws, movements, and stat type data from any existing Fighters.

## Preview

![the-ultimate-api-readme](https://user-images.githubusercontent.com/90172283/166004672-0a806c1a-5bda-4f76-a2f0-89f5a510f725.gif)

</br>

![the-ultimate-api-readme2](https://user-images.githubusercontent.com/90172283/166005685-8c59f6b8-6a26-4ce1-9e48-850369b3ec51.gif)

## Future Features

- A authorization system so only administrators can manipulate the database.
- A GUI so it's easier for users to send `add`, `put`, and `delete` requests.
- The ability for users to sign in and have their own independent version of the master database.

## System Requirements
- node.js 16+
- npm 8+
- postgreSQL 14+

### Getting Started

1. Clone the repository.
    ```shell
    git clone https://github.com/DreSean-Sutton/the-ultimate-api
    cd the-ultimate-api
    ```
2. Install all dependencies with NPM
    ```shell
    npm install
    ```
3. Copy example .env file
    ```shell
    cp .env.example .env
    ```
4. Change `DATABASE_URL=postgres://dev:dev@localhost/changeMe` in your .env file to the database name you desire. ex. `DATABASE_URL=postgres://dev:dev@localhost/my-example-name`

6. Create the database and set it's name to the previous name you chose
    ```shell
    createdb my-example-name
    ```
6. Import SQL code into database
    ```shell
    db:import
    ```
7. Start the server
    ```shell
    npm run dev
    ```
 
