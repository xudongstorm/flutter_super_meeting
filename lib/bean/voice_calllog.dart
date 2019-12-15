final String calllogName = "name";
final String calllogNumber = "number";
final String calllogCallType = "calltype";
final String calllogDate = "date";

class VoiceCalllog{
  String name;
  String number;
  String callType;
  String date;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      calllogName: name,
      calllogNumber: number,
      calllogCallType: callType,
      calllogDate: date
    };
    return map;
  }

  VoiceCalllog.fromMap(Map<String, dynamic> map){
    name = map[calllogName];
    number = map[calllogNumber];
    callType = map[calllogCallType];
    date = map[calllogDate];
  }
}