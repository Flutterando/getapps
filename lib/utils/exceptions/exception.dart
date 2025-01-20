abstract class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const AppException(this.message, [this.stackTrace]);

  @override
  String toString() {
    if (stackTrace != null) {
      return '$runtimeType: $message\n$stackTrace';
    } else {
      return '$runtimeType: $message';
    }
  }
}
