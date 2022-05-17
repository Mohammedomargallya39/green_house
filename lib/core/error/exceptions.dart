class ServerException implements Exception {
  final String message;

  ServerException({
    required this.message,
});
}

class CacheException implements Exception {
  final dynamic error;

  CacheException(this.error);
}