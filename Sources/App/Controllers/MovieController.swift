//
//  File.swift
//  
//
//  Created by 이승희 on 11/18/23.
//

import Foundation
import Vapor

struct MoviesController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let movies = routes.grouped("movies")
        
        movies.get(use: index)
        
        movies.get(":movieId", use: show)
    }
    
    func index(req: Request) async throws -> String {
        return "Index"
    }
    
    func show(req: Request) async throws -> String {
        guard let movieId = req.parameters.get("movieId") else {
            throw Abort(.internalServerError)
        }
        
        return "\(movieId)"
    }
}
