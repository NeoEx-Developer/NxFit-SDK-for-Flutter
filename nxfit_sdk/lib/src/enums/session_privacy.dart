enum SessionPrivacy {
  Public,
  FollowersOnly,
  Private;

  static SessionPrivacy of(String index) {
    return values.asNameMap()[index] ?? SessionPrivacy.Public;
  }
}
