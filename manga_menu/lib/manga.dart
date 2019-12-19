class Manga{
  int index;
  String title;
  String img;

  Manga({this.index, this.title, this.img});
  
  factory Manga.fromJson(Map<String, dynamic> json){
    return Manga(
      index: json['manga'][0],
      title: json['manga'[40]]['t'],
      img: json['manga'[40]]['img'],
    );
  }
}