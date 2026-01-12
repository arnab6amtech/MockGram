class ProfileModel {
  final String username;
  final String displayName;
  final String bio;
  final String profileImage;
  final int postsCount;
  final int followersCount;
  final int followingCount;
  final bool isPrivate;
  final bool isVerified;
  final List<HighlightModel> highlights;
  final List<ProfilePostModel> posts;

  ProfileModel({
    required this.username,
    required this.displayName,
    required this.bio,
    required this.profileImage,
    required this.postsCount,
    required this.followersCount,
    required this.followingCount,
    this.isPrivate = false,
    this.isVerified = false,
    required this.highlights,
    required this.posts,
  });
}

class HighlightModel {
  final String title;
  final String coverImage;

  HighlightModel({
    required this.title,
    required this.coverImage,
  });
}

class ProfilePostModel {
  final String id;
  final String imageUrl;
  final String? caption;
  final int likes;
  final int comments;
  final DateTime timestamp;
  final bool isVideo;
  final bool hasMultipleImages;

  ProfilePostModel({
    required this.id,
    required this.imageUrl,
    this.caption,
    required this.likes,
    required this.comments,
    required this.timestamp,
    this.isVideo = false,
    this.hasMultipleImages = false,
  });
}
