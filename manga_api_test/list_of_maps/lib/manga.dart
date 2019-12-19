class MangaEden{
  final int page;
  final int end;
  final int start;
  final int total;
  final List<Manga> mangas;
    
  MangaEden({this.end, this.mangas, this.page,  this.start, this.total});

  factory MangaEden.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['manga'] as List;
    print(list.runtimeType);
    List<Manga> mangaList = list.map((i) => Manga.fromJson(i)).toList();

    return MangaEden(
      page: parsedJson['end'],
      mangas: mangaList,
      end: parsedJson['end'],
      start: parsedJson['start'],
      total: parsedJson['total'], 
      );
  }

}
class Manga{
  final String alias;
  final String title;
  final String img;

  Manga({this.alias, this.title, this.img});
  



  factory Manga.fromJson(Map<String, dynamic> parsedJson){
    return Manga(
      img: parsedJson['im'],
      title: parsedJson['t'],
      alias: parsedJson['a'],
    );

  }

}