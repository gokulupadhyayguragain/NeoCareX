class ServerException implements Exception {
  final String? message;
  ServerException({this.message}) : super();
}

class StorageException implements Exception {
  final String? message;
  StorageException({this.message}) : super();
}
