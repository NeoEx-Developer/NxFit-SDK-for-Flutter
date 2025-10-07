import 'package:flutter_test/flutter_test.dart';
import 'package:nxfit_sdk/src/enums/session_privacy.dart';

void sessionPrivacyTests() {
  group('SessionPrivacy', () {
    test('of should return correct enum for given privacyName', () {
      expect(SessionPrivacy.of('Public'), SessionPrivacy.public);
      expect(SessionPrivacy.of('FollowersOnly'), SessionPrivacy.followersOnly);
      expect(SessionPrivacy.of('Private'), SessionPrivacy.private);
    });

    test('of should return public for unknown privacyName', () {
      expect(SessionPrivacy.of('Unknown'), SessionPrivacy.public);
    });

    test('compareTo should correctly compare two SessionPrivacy enums', () {
      expect(SessionPrivacy.public.compareTo(SessionPrivacy.private) < 0, true);
      expect(SessionPrivacy.private.compareTo(SessionPrivacy.public) > 0, true);
      expect(SessionPrivacy.followersOnly.compareTo(SessionPrivacy.followersOnly), 0);
    });
  });
}
