String handleFilePath(String path) {
  var fileName = path.split('/').last;
  return 'profile/$fileName';
}
