enum SessionPrivacy implements Comparable<SessionPrivacy> {
  public("Public"),
  followersOnly("FollowersOnly"),
  private("Private");

  final String privacyName;

  const SessionPrivacy(this.privacyName);

  static SessionPrivacy of(String privacyName) {
    return values.firstWhere((e) => e.privacyName == privacyName, orElse: () => public);
  }

  @override
  int compareTo(SessionPrivacy other) {
    return index - other.index;
  }
}
