library package_royaldle;

class Cards
{
  final int id;
  final String name;
  final int elixir;
  final String type;
  final String rarity;
  final int arena;
  final String description;

  const Cards({
    required this.id,
    required this.name,
    required this.elixir,
    required this.type,
    required this.rarity,
    required this.arena,
    required this.description
  });
  factory Cards.fromjson(Map<String,dynamic>json)
  {
    return Cards(
      id: json['id'],
      name: json['name'],
      elixir: json['elixir'],
      type: json['type'],
      rarity: json['rarity'],
      arena: json['arena'],
      description: json['description'],
    );
  }
  Map<String,Object?> toJson()
  {
    return {
      'id': id,
      'name':name,
      'elixir': elixir,
      'type' : type,
      'rarity' : rarity,
      'arena' : arena,
      'description':description,
    };
  }

}