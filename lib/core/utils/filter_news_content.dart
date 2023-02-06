import 'package:intl/intl.dart';

String filterNewsContent(String content) {
  return Bidi.stripHtmlIfNeeded(content).replaceAll(' ', '');
}
