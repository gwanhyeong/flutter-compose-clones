import 'post.dart';

class PostFeed {
  Post highlightedPost;
  List<Post> recommendedPosts;
  List<Post> popularPosts;
  List<Post> recentPosts;

  PostFeed(
      {required this.highlightedPost,
      required this.recommendedPosts,
      required this.popularPosts,
      required this.recentPosts});

  List<Post> get allPosts =>
      [highlightedPost, ...recommendedPosts, ...popularPosts, ...recentPosts];
}
