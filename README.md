# Receipt App

An app to generate receipts based on an input basket

Built in [Ruby](https://www.ruby-lang.org/).

## Assumptions

1. The format of the basket items will always be the same as in the examples ("quantity product at amount" or "quantity imported product at amount").
2. The product categories will be fixed (books, food and medical) and have fixed patterns (explanation below).
3. The product examples are the only ones available and their names can be used to form the category patterns (the only available pattern for books is book, for food is chocolate and for medical is pill).

## Getting started

There are two ways to run this project:

<details>
  <summary>Local installation</summary>

### Requirements

1. Install [ruby 3.4.3](https://gorails.com/setup/ubuntu/24.04#ruby).

#### Installation

1.  Clone the repo

    ```sh
    git clone git@github.com:thiagopnobre/receipt_app.git && cd receipt_app
    ```

2. Install the bundler

    ```sh
    gem install bundler
    ```

3. Install the dependencies

    ```sh
    bundle install
    ```

4. Run it

    ```sh
    ruby app.rb
    ```

</details>



<details>
  <summary>Dockerized installation</summary>

### Requirements

1. Install [docker](https://docs.docker.com/engine/install);
2. Install [docker-compose](https://docs.docker.com/compose/install/).

#### Installation

1.  Clone the repo

    ```sh
    git clone git@github.com:thiagopnobre/receipt_app.git && cd receipt_app
    ```

2. Run it

    ```sh
    docker-compose up
    ```

</details>



## Tests

To run the tests, execute:

  ```sh
  rspec
  ```
