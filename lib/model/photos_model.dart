class Photo{
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({required this.albumId,required this.id,required this.title,required this.url,required this.thumbnailUrl});

  factory Photo.fromJson(Map<String,dynamic> photo){
    return Photo(
      albumId:photo['albumId'],
      id:photo['id'],
      title:photo['title'],
      url:photo['url'],
      thumbnailUrl:photo['thumbnailUrl'],
    );
  }
}