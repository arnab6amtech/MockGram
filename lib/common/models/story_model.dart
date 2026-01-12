class StoryModel {
  final String username;
  final String userImage;
  final bool isOwn;

  StoryModel({
    required this.username,
    required this.userImage,
    this.isOwn = false,
  });
}