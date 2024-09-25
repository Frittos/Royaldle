library package_royaldle;


class Trys
{
  final int amount;
  final DateTime hours;
  final String cardName;


  const Trys({
    required this.amount,
    required this.cardName,
    required this.hours
  });
  factory Trys.fromjson(Map<String,dynamic>json)
  {
    return Trys(
      amount: json['amount'],
      cardName: json['cardName'],
      hours: json['hours']
    );
  }
  Map<String,Object?> toJson()
  {
    return {
      'amount': amount,
      'cardName':cardName,
      'hours': hours
    };
  }

}