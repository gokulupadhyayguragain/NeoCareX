abstract class Failure {
  final String? message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure({String? message}) : super(message);
}

class StorageFailure extends Failure {
  StorageFailure({String? message}) : super(message ?? 'Storage Failure');
}
