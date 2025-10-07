import 'package:flutter_test/flutter_test.dart';
import 'package:nxfit_sdk/src/enums/activity_type.dart';

void activityTypeTests() {
  group('ActivityType', () {
    test('of should return correct enum for given value', () {
      expect(ActivityType.of('Running'), ActivityType.running);
      expect(ActivityType.of('Walking'), ActivityType.walking);
      expect(ActivityType.of('Cycling'), ActivityType.cycling);
    });

    test('of should return other for unknown value', () {
      expect(ActivityType.of('UnknownActivity'), ActivityType.other);
    });

    test('of should handle all defined activity types', () {
      for (final activityType in ActivityType.values) {
        expect(ActivityType.of(activityType.value), activityType);
      }
    });

    test('compareTo should correctly compare two ActivityType enums', () {
      expect(ActivityType.running.compareTo(ActivityType.walking) < 0, isTrue);
      expect(ActivityType.walking.compareTo(ActivityType.running) > 0, isTrue);
      expect(ActivityType.cycling.compareTo(ActivityType.cycling), 0);
    });

    test('value should match the string provided in constructor', () {
      expect(ActivityType.other.value, "Other");
      expect(ActivityType.americanFootball.value, "AmericanFootball");
      expect(ActivityType.hiit.value, "HIIT");
    });
  });
}
