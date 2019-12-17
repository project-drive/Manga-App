class Manga{
  int index;
  String title;
  String img;

  Manga({this.index, this.title, this.img});
  
  factory Manga.fromJson(Map<String, dynamic> json){
    return Manga(
      index: json['manga'],
      title: json['manga']['t'],
      img: json['manga']['img'],
    );
  }
}