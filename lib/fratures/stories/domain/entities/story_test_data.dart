import 'package:stories_viewer_app/fratures/stories/domain/entities/story_model.dart';
import 'package:stories_viewer_app/fratures/stories/domain/entities/story_user_model.dart';

const StoryUserModel user = StoryUserModel(
  name: 'Ahmed Ayman',
  profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
);
final List<Story> stories = [
  Story(
    url:
    'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    media: MediaType.image,
    duration: Duration(seconds: 10),
    user: user,
  ),
   Story(
    url: 'https://player.vimeo.com/external/178514712.sd.mp4?s=5ce1aff4bf4922e82fa7593c4c5e23a71eb0e2a2&profile_id=164&oauth2_token_id=57447761',
    media: MediaType.video,
    user: user,
    duration: Duration(seconds: 7),
  ),
   Story(
    url:
    'https://st2.depositphotos.com/46950342/54846/v/600/depositphotos_548469364-stock-video-vertical-video-national-gallery-fountain.mp4',
    media: MediaType.video,
    duration: Duration(seconds: 0),
    user: user,
  ),
   Story(
    url:
    'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
    media: MediaType.image,
    duration: Duration(seconds: 5),
    user: user,
  ),
   Story(
    url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    media: MediaType.video,
    duration: Duration(seconds: 8),
    user: user,
  ),
];