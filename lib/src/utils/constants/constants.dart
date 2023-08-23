import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kPrimaryColor = Color(0XFF6A87F3);
const kSecondaryColor = Color(0XFF988BE8);
const kScaffoldColor = Color(0XFF4F6CD5);
const kredColor = Color(0xffe88b87);
const kblueColor = Color(0xff75cdff);
const kredDarkColor = Color(0xffdb736e);
const kredBehindTextColor = Color(0xffdb726e);
const kTextColor = Color(0XFF1D1D1F);
const kTextGreyColor = Color(0xffb6bbc8);
const kTextFieldFillColor = Color(0xffF7F8F9);
const kTextFieldContentColor = Color(0xffADB6C1);
const kTextFieldBorderColor = Color(0xffECEFF5);
const kCyanLightColor = Color(0xffd5eeee);
const kGrayCardColor = Color(0xfff7f8f9);

const kHeading1FontSize = 36.0;
const kHeading2FontSize = 28.0;

bool isPortrait(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.portrait;
}

double kWidth(BuildContext context) => MediaQuery.of(context).size.width;
double kHeight(BuildContext context) => MediaQuery.of(context).size.height;

String kOrganizersToString(List<String>? organizers) {
  if (organizers == null) {
    return '';
  }
  return organizers.toString().substring(1, organizers.toString().length - 1);
}

TextSpan kRich(String input, {TextStyle? style}) {
  const styles = {
    '_': TextStyle(fontStyle: FontStyle.italic),
    '*': TextStyle(fontWeight: FontWeight.bold),
    '~': TextStyle(decoration: TextDecoration.lineThrough),
    '```': TextStyle(fontFamily: 'monospace', color: Colors.black87),
  };
  final spans = <TextSpan>[];
  final pattern = RegExp(r'([_*~]|`{3})(.*?)\1');
  input.trim().splitMapJoin(pattern, onMatch: (m) {
    final input = m.group(2)!;
    final style = styles[m.group(1)];
    spans.add(pattern.hasMatch(input)
        ? kRich(input, style: style)
        : TextSpan(text: input, style: style));
    return '';
  }, onNonMatch: (String text) {
    spans.add(TextSpan(text: text));
    return '';
  });
  return TextSpan(style: const TextStyle(fontSize: 14), children: spans);
}

String kConvertNewLine(String content) {
  return content.replaceAll(r'\n', '\n');
}

String kFormatDate(String date) {
  return DateFormat('dd MMM yyyy').format(DateTime.parse(date)).toUpperCase();
}

//SnackBar And Its type
enum SnackType { error, success }

Map<SnackType, Color> snackColor = {
  SnackType.success: Colors.green,
  SnackType.error: kredDarkColor
};
void kShowSnackBar(BuildContext context, SnackType type, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: snackColor[type], content: Text(message)));
}
