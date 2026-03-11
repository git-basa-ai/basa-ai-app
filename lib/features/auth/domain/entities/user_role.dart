/// User role enumeration for role-based access control.
enum UserRole {
  /// A Grade 1–2 learner using LRN login.
  learner,

  /// A teacher using email/password login.
  teacher,

  /// A DepEd coordinator using email/password login.
  coordinator,
}
