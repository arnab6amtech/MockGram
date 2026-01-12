class PostModel {
  final String username;
  final String userImage;
  final String location;
  final List<String> postImages;
  final int likes;
  final String likedBy;
  final String caption;
  final bool isVerified;
  final DateTime timestamp;

  PostModel({
    required this.username,
    required this.userImage,
    required this.location,
    required this.postImages,
    required this.likes,
    required this.likedBy,
    required this.caption,
    this.isVerified = false,
    required this.timestamp,
  });
}