enum ApiError {
  loadImage('Error load image'),
  loadUser('Failed to load user: data null'),
  emptyResponse('Data is empty');

  const ApiError(this.errorString);

  final String errorString;
}
