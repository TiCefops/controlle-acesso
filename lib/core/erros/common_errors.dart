enum AppError {
  notFound,
  connectionError,

}

class CommonErrors {
  final AppError key;
  final String? message;

  const CommonErrors({
    required this.key,
    this.message,
  });
}