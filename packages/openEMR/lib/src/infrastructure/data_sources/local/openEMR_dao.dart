/// This is generic class which provides some methods for CRUD operations
/// in local storage.
abstract class OpenEMRDao<T> {
  /// Create [entity] in database.
  Future<void> create(T entity);

  /// Read entity from database.
  Future<T?> read();

  /// Update [entity] in database.
  Future<void> update(T entity);

  /// Delete stored entity from database.
  Future<void> delete();
}
