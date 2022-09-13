import 'package:soq_app/app/constants.dart';

extension NullableString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullableInt on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullableDouble on double? {
  double orDouble() {
    if (this == null) {
      return Constants.isDouble;
    } else {
      return this!;
    }
  }
}

extension NonNullableBool on bool? {
  bool orFalse() {
    if (this == null) {
      return Constants.boolFalse;
    } else {
      return this!;
    }
  }
}

extension NonNullableList on List<String>? {
  List<String> orList() {
    if (this == null) {
      return Constants.stringsList;
    } else {
      return this!;
    }
  }
}
