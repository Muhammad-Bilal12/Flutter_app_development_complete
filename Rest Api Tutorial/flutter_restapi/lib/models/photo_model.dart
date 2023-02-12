

// Custom Model with null safety
class PhotosModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PhotosModel({this.albumId,required this.id, required this.title, required this.url, this.thumbnailUrl});
}
