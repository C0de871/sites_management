// ignore_for_file: constant_identifier_names

enum UserRole {
  MANAGER,
  GUEST,
  WORKER,
  SITE_ADMIN,
  MTN;

  static UserRole roleFromString(String role) => switch (role) {
        "manager" => UserRole.MANAGER,
        "guest" => UserRole.GUEST,
        "employee" => UserRole.WORKER,
        "sites_admin" => UserRole.SITE_ADMIN,
        "mtn_account" => UserRole.MTN,
        String() => UserRole.GUEST,
      };
}
