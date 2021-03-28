extension NullWhenEmptySpaceExtension on String? {
  String? nullWhenEmptySpace() {
    var value = this;

    if (value == null) {
      return null;
    }

    value = value.trim();

    if (value == '') {
      return null;
    }

    return value;
  }
}

extension ValidateCEPExtension on String {
  String getValidatedCEP() {
    var value = this;

    value = value.replaceAll(RegExp('[^0-9]'), '');

    if (value.isNotEmpty != true || value.length != 8) {
      throw Exception('CEP must be 8 character long');
    }

    return value;
  }
}
