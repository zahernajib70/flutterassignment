class Details {
  String? eventID;
  String eventName;
  String? eventDate;
  String eventImage;
  String venueName;
  int ? eventRating;
  String eventDescription;
  List ? lineupList;
  List ? musicTypes;

  Details(
      {required this.eventID,
      required this.eventName,
      required this.eventDate,
      required this.eventImage,
      required this.venueName,
      required this.eventRating,
      required this.eventDescription,
      required this.lineupList,
      required this.musicTypes});
}


class EventDate1 {
  String? iSeconds;
  String ?iNanoseconds;

  EventDate1({this.iSeconds, this.iNanoseconds});
}
