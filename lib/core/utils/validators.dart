/// 检查邮箱格式
bool duIsEmail(String? input) {
  if (input == null || input.isEmpty) return false;
  // 邮箱正则
  String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  return RegExp(regexEmail).hasMatch(input);
}

/// 检查字符长度
bool duCheckStringLength(String? input, int length) {
  if (input == null || input.isEmpty) return false;
  return input.length >= length;
}

bool duIsPhone(String? input) {
  if (input == null || input.isEmpty) return false;
  RegExp exp = RegExp(
      r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
  return exp.hasMatch(input);
}

bool duIsIdCard(String? input) {
  if (input == null || input.isEmpty) return false;
  RegExp exp = RegExp(
      r'^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|[Xx])$');
  return exp.hasMatch(input);
}

bool duChineseNickName(String? input) {
  if (input == null || input.isEmpty) return false;
  RegExp exp = RegExp('[\u4e00-\u9fa5]');
  return exp.hasMatch(input);
}
