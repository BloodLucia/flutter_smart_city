hidePhoneNumber(String? input) {
  if (input == 'null' || input == null || input == '') return;

  return input.replaceRange(7, input.length, '****');
}
