import 'package:flutter/material.dart';
import '../models/post_model.dart';

class InstagramHomePage extends StatelessWidget {
  const InstagramHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<PostModel> posts = [

      PostModel(
        username: 'budi',
        userImage: 'https://i.pravatar.cc/150?img=1',
        postImage:
            'https://picsum.photos/id/1011/500/500',
        caption: 'Liburan dulu 🌴',
        likes: 128,
      ),

      PostModel(
        username: 'sari',
        userImage: 'https://i.pravatar.cc/150?img=2',
        postImage:
            'https://picsum.photos/id/1015/500/500',
        caption: 'Pemandangan hari ini ✨',
        likes: 256,
      ),

      PostModel(
        username: 'andi',
        userImage: 'https://i.pravatar.cc/150?img=3',
        postImage:
            'https://picsum.photos/id/1016/500/500',
        caption: 'Ngopi santai ☕',
        likes: 98,
      ),
    ];

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),

        actions: [

          IconButton(
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            onPressed: () {},
          ),

          IconButton(
            icon: const Icon(
              Icons.send_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(

        child: Column(
          children: [

            // STORIES
            SizedBox(
              height: 110,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: posts.length,

                itemBuilder: (context, index) {

                  final post = posts[index];

                  return Padding(
                    padding: const EdgeInsets.all(8),

                    child: Column(
                      children: [

                        CircleAvatar(
                          radius: 32,
                          backgroundImage:
                              NetworkImage(post.userImage),
                        ),

                        const SizedBox(height: 6),

                        Text(post.username),
                      ],
                    ),
                  );
                },
              ),
            ),

            const Divider(),

            // POSTS
            ListView.builder(
              itemCount: posts.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              itemBuilder: (context, index) {

                final post = posts[index];

                return Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    // HEADER POST
                    ListTile(

                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(post.userImage),
                      ),

                      title: Text(
                        post.username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      trailing: const Icon(Icons.more_vert),
                    ),

                    // FOTO POST
                    Image.network(
                      post.postImage,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),

                    // ICON
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),

                      child: Row(
                        children: [

                          const Icon(Icons.favorite_border),
                          const SizedBox(width: 16),

                          const Icon(Icons.chat_bubble_outline),
                          const SizedBox(width: 16),

                          const Icon(Icons.send_outlined),

                          const Spacer(),

                          const Icon(Icons.bookmark_border),
                        ],
                      ),
                    ),

                    // LIKE
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),

                      child: Text(
                        '${post.likes} likes',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 4),

                    // CAPTION
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),

                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                          ),

                          children: [

                            TextSpan(
                              text: '${post.username} ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            TextSpan(
                              text: post.caption,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}