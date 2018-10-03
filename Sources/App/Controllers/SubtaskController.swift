import Vapor

/// Controls basic CRUD operations on `Subtask`s.
final class SubtaskController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[Subtask]> {
        return Subtask.query(on: req).all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<Subtask> {
        return try req.content.decode(Subtask.self).flatMap { todo in
            return todo.save(on: req)
        }
    }

    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Subtask.self).flatMap { todo in
            return todo.delete(on: req)
        }.transform(to: .ok)
    }
}
