// ignore_for_file: constant_identifier_names

enum UserRole {
  manager,
  employee,
  sites_admin,
  mtn_account;

  static UserRole roleFromString(String role) => switch (role) {
        "manager" => UserRole.manager,
        "employee" => UserRole.employee,
        "sites_admin" => UserRole.sites_admin,
        "mtn_account" => UserRole.mtn_account,
        String() => UserRole.employee,
      };
}

// هي اسماء الرولات
// employee
// mtn_account
// sites_admin
// manager
