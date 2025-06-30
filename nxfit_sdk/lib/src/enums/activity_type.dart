import 'package:flutter/foundation.dart';

/// Indicates the type of activity for a particular session. The String [value] is used as a unique code by the NXFit API.
enum ActivityType implements Comparable<ActivityType> {
  other("Other"),
  aerobics("Aerobics"),
  americanFootball("AmericanFootball"),
  archery("Archery"),
  australianFootball("AustralianFootball"),
  badminton("Badminton"),
  baseball("Baseball"),
  basketball("Basketball"),
  beachVolleyball("BeachVolleyball"),
  biathlon("Biathlon"),
  boxing("Boxing"),
  calisthenics("Calisthenics"),
  cardioTraining("CardioTraining"),
  circuitTraining("CircuitTraining"),
  climbing("Climbing"),
  coreTraining("CoreTraining"),
  cricket("Cricket"),
  crossCountrySkiing("CrossCountrySkiing"),
  crossFit("CrossFit"),
  crossTraining("CrossTraining"),
  curling("Curling"),
  cycling("Cycling"),
  dancing("Dancing"),
  diving("Diving"),
  elliptical("Elliptical"),
  englishFootball("EnglishFootball"),
  fencing("Fencing"),
  frisbee("Frisbee"),
  golf("Golf"),
  gymnastics("Gymnastics"),
  handball("Handball"),
  handCycling("HandCycling"),
  hiit("HIIT"),
  hiking("Hiking"),
  hockey("Hockey"),
  horsebackRiding("HorsebackRiding"),
  iceSkating("IceSkating"),
  indoorVolleyball("IndoorVolleyball"),
  intervalTraining("IntervalTraining"),
  jumpingRope("JumpingRope"),
  kayaking("Kayaking"),
  kickboxing("Kickboxing"),
  lacrosse("Lacrosse"),
  meditation("Meditation"),
  mixedMartialArts("MixedMartialArts"),
  mountainBiking("MountainBiking"),
  pilates("Pilates"),
  polo("Polo"),
  preparationAndRecovery("PreparationAndRecovery"),
  racquetball("Racquetball"),
  rockClimbing("RockClimbing"),
  rowing("Rowing"),
  rugby("Rugby"),
  running("Running"),
  sailing("Sailing"),
  scubaDiving("ScubaDiving"),
  skateboarding("Skateboarding"),
  skating("Skating"),
  skiing("Skiing"),
  skyDiving("SkyDiving"),
  snowboarding("Snowboarding"),
  snowshoeing("Snowshoeing"),
  softball("Softball"),
  spinBike("SpinBike"),
  squash("Squash"),
  stationaryBiking("StationaryBiking"),
  strengthTraining("StrengthTraining"),
  stretching("Stretching"),
  surfing("Surfing"),
  swimming("Swimming"),
  tableTennis("TableTennis"),
  tennis("Tennis"),
  treadmill("Treadmill"),
  triathlon("Triathlon"),
  volleyball("Volleyball"),
  walking("Walking"),
  waterPolo("WaterPolo"),
  weightlifting("Weightlifting"),
  wheelchairRun("WheelchairRun"),
  wheelchairWalk("WheelchairWalk"),
  windsurfing("Windsurfing"),
  yoga("Yoga");

  /// The unique code for the enumeration as used by the NXFit API. This is not intended to be displayed to the user.
  final String value;

  const ActivityType(this.value);

  /// Returns the [ActivityType] for the given activity type value. The value must be one of the defined values supported by the NXFit API.
  /// If the value is not supported, [ActivityType.other] is returned.
  static ActivityType of(final String activityTypeValue) {
    try {
      return values.singleWhere((v) => v.value == activityTypeValue);
    } on StateError {
      if (kDebugMode) print("Unknown activity type: $activityTypeValue");

      return ActivityType.other;
    }
  }

  @override
  int compareTo(ActivityType other) {
    return other.index - index;
  }
}
