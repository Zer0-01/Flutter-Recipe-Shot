import 'package:flutter/material.dart';

class FeedView extends StatelessWidget {
  FeedView({super.key});

  final List<Tweet> tweets = [
    Tweet(
      username: 'John Doe',
      handle: '@johndoe',
      content: 'This is my first tweet!',
      profileImageUrl: 'https://via.placeholder.com/150',
      timeAgo: '2h',
      imageUrl: 'https://via.placeholder.com/500',
    ),
    Tweet(
      username: 'Jane Smith',
      handle: '@janesmith',
      content: 'Loving Flutter for mobile development! ❤️',
      profileImageUrl: 'https://via.placeholder.com/150',
      timeAgo: '1h',
      imageUrl: '',
    ),
    Tweet(
      username: 'Tech Guru',
      handle: '@techguru',
      content: 'Check out my latest blog on mobile app development! 📱',
      profileImageUrl: 'https://via.placeholder.com/150',
      timeAgo: '30m',
      imageUrl: 'https://via.placeholder.com/500',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tweets.length,
      itemBuilder: (context, index) {
        var tweet = tweets[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(tweet.profileImageUrl),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tweet.username,
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(tweet.handle),
                      ],
                    ),
                    const Spacer(),
                    Text(tweet.timeAgo),
                  ],
                ),
                const SizedBox(height: 10),
                Text(tweet.content),
                if (tweet.imageUrl.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.network(tweet.imageUrl),
                  ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.comment),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.repeat),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Tweet {
  final String username;
  final String handle;
  final String content;
  final String profileImageUrl;
  final String timeAgo;
  final String imageUrl;

  Tweet({
    required this.username,
    required this.handle,
    required this.content,
    required this.profileImageUrl,
    required this.timeAgo,
    required this.imageUrl,
  });
}
