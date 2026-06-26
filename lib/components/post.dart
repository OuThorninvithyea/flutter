import 'package:first_learn/components/hover_button.dart';
import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  final String profileImage;
  final String postImage;
  final String username;
  final String caption;

  const Posts({
    super.key,
    this.profileImage = 'assets/images/hustle_shirt.png',
    this.postImage = 'assets/images/hustle_shirt.png',
    this.username = 'username',
    this.caption = 'Yeah no captions Bitch',
  });

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  bool isLiked = false;
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(left: 10, right: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    widget.profileImage,
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 400,
            child: Image.asset(
              widget.postImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Icon(Icons.broken_image, size: 64));
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: [
                HoverButton(
                  onTap: () => setState(() => isLiked = !isLiked),
                  padding: EdgeInsets.zero,
                  defaultColor: Colors.transparent,
                  hoverColor: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(4),
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    size: 28,
                    color: isLiked ? Colors.red : Colors.black,
                  ),
                ),
                const SizedBox(width: 16),
                HoverButton(
                  onTap: () {},
                  padding: EdgeInsets.zero,
                  defaultColor: Colors.transparent,
                  hoverColor: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                  child: const Icon(Icons.chat_bubble_outline, size: 28),
                ),
                const SizedBox(width: 16),
                HoverButton(
                  onTap: () {},
                  padding: EdgeInsets.zero,
                  defaultColor: Colors.transparent,
                  hoverColor: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                  child: const Icon(Icons.send_outlined, size: 28),
                ),
                const Spacer(),
                HoverButton(
                  onTap: () => setState(() => isBookmarked = !isBookmarked),
                  padding: EdgeInsets.zero,
                  defaultColor: Colors.transparent,
                  hoverColor: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4),
                  child: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Text(widget.caption, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
