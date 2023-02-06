hidePhoneNumber(String input) {
  return input.replaceRange(7, input.length, '****');
}
