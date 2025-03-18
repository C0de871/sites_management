extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

// Extension to capitalize strings
extension StringCapitalize on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension StringValidation on String? {
  bool get isEmptyOrWhitespace {
    return this?.trim().isEmpty ??
        true; // Returns true if null or empty/just spaces
  }
}
