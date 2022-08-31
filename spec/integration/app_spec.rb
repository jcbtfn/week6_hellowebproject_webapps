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

    context "POST to /sort-names1" do
        it "returns 200 OK with the string sorted alphabetically" do
            response = post("/sort-names1", names: "Romén,Pelinor,Añaterve,Beneharo,Bencomo,Adjoña,Acaimo,Pelicar,Tegueste,Bentor,Tinerfe,Tinguaro")

            # Assert the response status code and body.
            expect(response.status).to eq(200)
            expect(response.body).to eq("Acaimo, Adjoña, Añaterve, Bencomo, Beneharo, Bentor, Pelicar, Pelinor, Romén, Tegueste, Tinerfe, Tinguaro")
        end
    end

    context "POST to /sort-names2" do
        it "returns 200 OK with the string of names (with spaces) sorted alphabetically" do
            response = post("/sort-names2", names2: "Romén, Pelinor, Añaterve, Beneharo, Bencomo, Adjoña, Acaimo, Pelicar, Tegueste, Bentor, Tinerfe, Tinguaro")

            # Assert the response status code and body.
            expect(response.status).to eq(200)
            expect(response.body).to eq("Acaimo, Adjoña, Añaterve, Bencomo, Beneharo, Bentor, Pelicar, Pelinor, Romén, Tegueste, Tinerfe, Tinguaro")
        end
    end

    context "POST to /sort-names2b" do
        it "returns 200 OK with the string of exoplanet names (with spaces) sorted alphabetically" do
            response = post("/sort-names2b", names2b: "BD-17 63 b, BD+14 4559 b, HAT-P-14 b, HD 100655 b, HIP 79431 b, PSR 1257+12 c, TrES-3 b, WASP-161 b, XO-5 b")

            # Assert the response status code and body.
            expect(response.status).to eq(200)
            expect(response.body).to eq("BD+14 4559 b, BD-17 63 b, HAT-P-14 b, HD 100655 b, HIP 79431 b, PSR 1257+12 c, TrES-3 b, WASP-161 b, XO-5 b")
        end
    end

    context "POST to /sort-names3" do
        it "returns 200 OK with a string (from the array of names) sorted alphabetically" do
            #binding.irb
            response = post("/sort-names3", names3: ["Romén", "Pelinor", "Añaterve", "Beneharo", "Bencomo", "Adjoña", "Acaimo", "Pelicar", "Tegueste", "Bentor", "Tinerfe", "Tinguaro"])
            
            # Assert the response status code and body.
            expect(response.status).to eq(200)
            expect(response.body).to eq("Acaimo, Adjoña, Añaterve, Bencomo, Beneharo, Bentor, Pelicar, Pelinor, Romén, Tegueste, Tinerfe, Tinguaro")
        end
    end

    context "POST to /sort-names3" do
        it "returns 200 OK with a string (from the array of exoplanets names) sorted alphabetically" do
            #binding.irb
            response = post("/sort-names3", names3: ["BD-17 63 b", "BD+14 4559 b", "HAT-P-14 b", "HD 100655 b", "HIP 79431 b", "PSR 1257+12 c", "TrES-3 b", "WASP-161 b", "XO-5 b"])
            
            # Assert the response status code and body.
            expect(response.status).to eq(200)
            expect(response.body).to eq("BD+14 4559 b, BD-17 63 b, HAT-P-14 b, HD 100655 b, HIP 79431 b, PSR 1257+12 c, TrES-3 b, WASP-161 b, XO-5 b")
        end
    end

end