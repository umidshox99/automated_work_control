import 'package:easy_localization/easy_localization.dart';

extension Extension on String? {
  bool isNotNullOrEmpty() => !(this == null || this == '');
}
extension DoubleExtension on double? {
  String toMoneyFormat() =>NumberFormat.currency(locale: "en_US",
      symbol: "").format(this).replaceAll(",", " ");
}