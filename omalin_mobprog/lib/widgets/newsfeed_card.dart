import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class NewsFeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final bool hasImage;
  final String? avatarImage;
  final String? imageUrl;

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes = 0,
    this.hasImage = false,
    this.avatarImage,
    this.imageUrl,
  });

  @override
  State<NewsFeedCard> createState() => _NewsFeedCardState();
}

class _NewsFeedCardState extends State<NewsFeedCard> {
  late int likeCount;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likeCount = widget.numOfLikes;
  }

  void likePost() {
    setState(() {
      if (isLiked) {
        likeCount--;
        isLiked = false;
      } else {
        likeCount++;
        isLiked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.w),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Profile information
            Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: widget.avatarImage != null
                      ? AssetImage(widget.avatarImage!)
                      : null,
                  child: widget.avatarImage == null
                      ? const Icon(Icons.person)
                      : null,
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.date,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(Icons.more_horiz),
              ],
            ),

            SizedBox(height: 10.h),

            // Post content
            Text(
              widget.postContent,
              style: TextStyle(fontSize: 13.sp),
            ),

            SizedBox(height: 10.h),

            // Post image
            if (widget.hasImage && widget.imageUrl != null)
              Image.asset(
                widget.imageUrl!,
                width: double.infinity,
                height: 400.h,
                fit: BoxFit.cover,
              ),

            SizedBox(height: 10.h),

            // Like, Comment and Share buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                // Like button
                TextButton.icon(
                  onPressed: likePost,
                  icon: Icon(
                    isLiked
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: isLiked ? Colors.red : FB_PRIMARY,
                  ),
                  label: Text(likeCount.toString()),
                ),

                // Comment button
                TextButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Comment button clicked'),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.chat_bubble_outline,
                    color: FB_PRIMARY,
                  ),
                  label: const Text('Comment'),
                ),

                // Share button
                TextButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Share button clicked'),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.send,
                    color: FB_PRIMARY,
                  ),
                  label: const Text('Share'),
                ),
              ],
            ),

            // Comment section
            Row(
              children: [
                CircleAvatar(
                  radius: 15.r,
                  backgroundImage: const AssetImage(
                    'assets/calamity.jpg',
                  ),
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Text(
                      'Write a comment...',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            const Text(
              'View comments',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
