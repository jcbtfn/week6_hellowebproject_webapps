# {{ METHOD }} {{ PATH}} Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

  Update 1: get/hello
  Update 1.1: get/hello + param name > get/hello?name=Jacob
  Update 2: post/submit + params name & message > post/submit?name=Jacob&message=message

  Update 3: get/names 


## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._


  Update 1: get/hello 
  Hello!

  Update 1.1: get/hello + param name > get/hello?name=Jacob
  Hello, name (from params)!

  Update 2: post/submit + params name & message > post/submit?name=Jacob&message=message
  Thanks name (from params), you sent this message: message (from params)

  Update 3: get/names 
  Julia, Mary, Karim


## 3. Write Examples

  # UPDATE 1
  # Request:
  GET /hello
  # Expected response:
  Response for 200 OK
  Hello!

  # UPDATE 1.1
  # Request:
  GET /hello?name=Jacob
  # Expected response:
  Response for 200 OK
  Hello, Jacob!

  # UPDATE 2
  # Request:
  POST /submit?name=Dana&message=Get ready for the daily meditation
  # Expected response:
  Response for 200 OK
  Thanks Dana, you sent this message: "Get ready for the daily meditation"

  # UPDATE 3
  # Request:
  GET /names
  # Expected response:
  Response for 200 OK
  Julia, Mary, Karim

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

    context "GET to /" do
        it "returns 200 OK with the right content" do
        # Send a GET request to /
        # and returns a response object we can test.
        response = get("/hello?name=Jacob")

        # Assert the response status code and body.
        expect(response.status).to eq(200)
        expect(response.body).to eq("Hello Jacob")
        end
    end

    context "POST to /submit" do
        it "returns 200 OK with the right content" do
        # Send a POST request to /submit
        # with some body parameters
        # and returns a response object we can test.
        response = post("/submit", name: "Dana", message: "Get ready for the daily meditation")

        # Assert the response status code and body.
        expect(response.status).to eq(200)
        expect(response.body).to eq('Thanks Dana, you sent this message: "Get ready for the daily meditation"')
        end
    end

    context "GET to /names" do
        it "returns 200 OK with the right content" do
        # Send a GET request to /
        # and returns a response object we can test.
        response = get("/names")

        # Assert the response status code and body.
        expect(response.status).to eq(200)
        expect(response.body).to eq("Julia, Mary, Karim")
        end
    end

end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

