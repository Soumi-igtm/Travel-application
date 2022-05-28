class DataModel{
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;
  DataModel({
    required  this.name,
    required  this.img,
    required  this.price,
    required  this.people,
    required  this.stars,
    required  this.description,
    required  this.location,
  });
  factory DataModel.fromJson(Map<String, dynamic>){
    return DataModel(name: name,
    img: img,
  price: price,
  people: people,
  stars: stars,
  description: description,
  location: location)
  }
}