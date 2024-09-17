import 'package:flutter/material.dart';

class CardFeedWidget extends StatelessWidget {
  final double verticalMargin;
  final double horizontalMargin;
  final double padding;
  final String profileImageUrl;
  final String username;
  final String tweetHandle;
  final String postDuration;
  final String description;
  final String imageUrl;
  const CardFeedWidget({
    super.key,
    this.verticalMargin = 8.0,
    this.horizontalMargin = 12.0,
    this.padding = 12.0,
    this.profileImageUrl = 'https://via.placeholder.com/150',
    this.username = '',
    this.tweetHandle = '',
    this.postDuration = '',
    this.description = '',
    this.imageUrl = '',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: verticalMargin,
        horizontal: horizontalMargin,
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(tweetHandle),
                  ],
                ),
                const Spacer(),
                Text(postDuration),
              ],
            ),
            const SizedBox(height: 10),
            Text(description),
            if (imageUrl.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.network(imageUrl),
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
  }
}
