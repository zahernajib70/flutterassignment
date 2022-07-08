class Event {
  String eventID;
  String eventName;
  String venueName;
  String? eventDate;
  String eventImage;
  

  Event(
      {required this.eventID,
      required this.eventName,
      required this.venueName,
      required this.eventDate,
      required this.eventImage});
}

class EventDate {
  String? iSeconds;
  String? iNanoseconds;

  EventDate({this.iSeconds, this.iNanoseconds});
}
