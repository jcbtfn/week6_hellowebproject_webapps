# file: spec/integration/application_spec.rb

require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
    # This is so we can use rack-test helper methods.
    include Rack::Test::Methods

    # We need to declare the `app` value by instantiating the Application
    # class so our tests work.
    let(:app) { Application.new }

    context "when GET to /hello" do
        it "#returns 200 OK with the right content" do
        # Send a GET request to /
        # and returns a response object we can test.
        response = get("/hello?name=Jacob")
        # Assert the response status code and body.
        expect(response.status).to eq(200)
        expect(response.body).to eq("Hello Jacob")
        end
    end

    context "when POST to /submit" do
        it "#returns 200 OK with the right content" do
        # Send a POST request to /submit
        # with some body parameters
        # and returns a response object we can test.
        response = post("/submit", name: "Dana", message: "Get ready for the daily meditation")
        # Assert the response status code and body.
        expect(response.status).to eq(200)
        expect(response.body).to eq('Thanks Dana, you sent this message: "Get ready for the daily meditation"')
        end
    end

    context "when GET to /names" do
        it "#returns 200 OK with the right content" do
        # Send a GET request to /
        # and returns a response object we can test.
        response = get("/names")
        # Assert the response status code and body.
        expect(response.status).to eq(200)
        expect(response.body).to eq("Julia, Mary, Karim")
        end
    end

end