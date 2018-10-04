import FluentSQLite
import Vapor
import Authentication

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    /// Register providers first
    try services.register(FluentSQLiteProvider())
	try services.register(AuthenticationProvider())

    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    /// middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)

    // Configure a SQLite database
    let sqlite = try SQLiteDatabase(storage: .memory)

    /// Register the configured SQLite database to the database config.
    var databases = DatabasesConfig()
    databases.add(database: sqlite, as: .sqlite)
    services.register(databases)

    /// Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: Subtask.self, database: .sqlite)
	migrations.add(model: Task.self, database: .sqlite)
	migrations.add(model: Project.self, database: .sqlite)
	migrations.add(model: User.self, database: .sqlite)
	migrations.add(model: Comment.self, database: .sqlite)
	migrations.add(model: ActivityItem.self, database: .sqlite)
	migrations.add(model: UserToken.self, database: .sqlite)

    services.register(migrations)

	// Create a new NIO websocket server
	let wss = NIOWebSocketServer.default()

	// Add WebSocket upgrade support to GET /echo
	wss.get("echo") { ws, req in
		// Add a new on text callback
		ws.onText { ws, text in
			// Simply echo any received text
			ws.send(text)
		}
	}

	// Add WebSocket upgrade support to GET /chat/:name
	wss.get("chat", String.parameter) { ws, req in
		let name = try req.parameters.next(String.self)
		ws.send("Welcome, \(name)!")
		// ...
	}

	// Register our server
	services.register(wss, as: WebSocketServer.self)
}
