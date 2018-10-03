import Vapor
import Crypto

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
	
	// public routes
	let userController = UserController()
	router.post("users", use: userController.create)

	// basic / password auth protected routes
	let basic = router.grouped(User.basicAuthMiddleware(using: BCryptDigest()))
	basic.post("login", use: userController.login)

	// bearer / token auth protected routes
	let bearer = router.grouped(User.tokenAuthMiddleware())

    // Example of configuring a controller
    let subtaskController = SubtaskController()
    bearer.get("subtasks", use: subtaskController.index)
    bearer.post("subtasks", use: subtaskController.create)
    bearer.delete("subtasks", Subtask.parameter, use: subtaskController.delete)
}
