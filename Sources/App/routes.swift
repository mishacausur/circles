import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return req.view.render("index", ["title": "Hello Vapor!"])
    }; app.get { req in
        return "NEW WEB APP WORKS!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    app.get("main") { req -> String in
        return "Main page"
    }
    
    app.on(.GET, "one") { _ in
        return "HIHIHIHIHI"
    }
    
    app.post("post") { req -> String in
        let post = try req.content.decode(Post.self)
        print(post.name) // "world"
        return "\(HTTPStatus.ok)"
    }
}

struct Post: Content {
    let name: String
}
