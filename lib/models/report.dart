class Report {
  final int temp;
  final String wax;
  final String line;
  final String timestamp;

  Report({this.wax,this.line,this.temp,this.timestamp});

  Report.fromJson(Map<String,dynamic> parsedJson)
    : temp = parsedJson['temp'],
      wax = parsedJson['wax'],
      line = parsedJson['line'],
      timestamp = parsedJson['timestamp'];
}