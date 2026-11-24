import 'package:material_ui/material_ui.dart';
import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [

        // First post
        NewsFeedCard(
          userName: 'Calamity',
          postContent: 'Cleaning Done!!',
          numOfLikes: 58,
          date: 'October 11',
          avatarImage: 'assets/calamity.jpg',
          hasImage: false,
        ),

        // Second post
        NewsFeedCard(
          userName: 'Minty',
          postContent: 'Kicking off the holiday season with a workout!',
          numOfLikes: 148,
          date: 'December 2',
          avatarImage: 'assets/image/minty.jpg',
          hasImage: true,
          imageUrl: 'assets/image/workout.jpg',
        ),
      ],
    );
  }
}
