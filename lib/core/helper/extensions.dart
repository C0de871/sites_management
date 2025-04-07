import 'package:flutter/material.dart';

import '../shared/enums/user_role.dart';

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
    return this?.trim().isEmpty ?? true; // Returns true if null or empty/just spaces
  }
}

extension UserRoleExtension on UserRole {
  String get userRoleName {
    switch (this) {
      case UserRole.WORKER:
        return 'Worker';
      case UserRole.MTN:
        return 'MTN';
      case UserRole.SITE_ADMIN:
        return 'sites_admin';
      case UserRole.MANAGER:
        return 'Manager';
      case UserRole.GUEST:
        return 'Guest';
    }
  }

  Color get color {
    switch (this) {
      case UserRole.WORKER:
        return Colors.blue;
      case UserRole.MTN:
        return Colors.amber;
      case UserRole.SITE_ADMIN:
        return Colors.green;
      case UserRole.MANAGER:
        return Colors.purple;
      case UserRole.GUEST:
        return Colors.blueGrey;
    }
  }

 
}

// reposit
