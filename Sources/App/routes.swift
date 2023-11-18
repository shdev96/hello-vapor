import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get("movies", ":genre") { req async throws -> String in
        
        guard let genre = req.parameters.get("genre") else {
            throw Abort(.badRequest)
        }
        return "All movies of genre: \(genre)"
    }
    
    app.get("customers", ":customerId") {req async throws -> String in
        
        guard let customerId = req.parameters.get("customerId", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "\(customerId)"
    }
    
    app.get("movies"){ req async in
        [Movie(title: "Batman")]
    }
    
    app.post("movies") { req async throws in
    
        let movie = try req.content.decode(Movie.self)
        return movie;
    }
    
    app.get("hotels") { req async in

        let sortOrder: String?=req.query["sort"]
        print(sortOrder)
        return HTTPStatus.ok
    }
    
    app.get("hotles-query-strict") { req async throws in
        
        let hotelQery = try req.query.decode(HotelQuery.self)
        return hotelQery
        
    }
}
