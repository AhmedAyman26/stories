import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stories_viewer_app/fratures/stories/domain/entities/story_model.dart';
import 'package:stories_viewer_app/fratures/stories/domain/video_entity.dart';
import 'package:stories_viewer_app/fratures/stories/ui/pages/view_story_page/widgets/animated_bar_widget.dart';
import 'package:stories_viewer_app/fratures/stories/ui/pages/view_story_page/widgets/story_video_view.dart';
import 'package:stories_viewer_app/story_video_view.dart';
import 'package:video_player/video_player.dart';

class StoryScreen extends StatefulWidget {
  final List<Story> stories;

  const StoryScreen({super.key, required this.stories});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentIndex = 0;
  late AnimationController _animationController;
  bool isLoved=false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(vsync: this);

    final Story firstStory = widget.stories.first;
    _loadStory(story: firstStory, animateToPage: false);


    //to move to the next story when the current story is finished
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
        _animationController.reset();
        setState(() {
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            _loadStory(story: widget.stories[_currentIndex]);
          } else {
            _currentIndex = 0;
            _loadStory(story: widget.stories[_currentIndex]);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Story story = widget.stories[_currentIndex];
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.96,
            child: GestureDetector(
              onTapDown: (details) => _onTapDown(details, story),
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) {


                      widget.stories[_currentIndex].controller?.seekTo(const Duration(seconds: 0));
                      widget.stories[_currentIndex].controller?.pause();
                      _loadStory(story: widget.stories[value] , animateToPage: false);
                      _currentIndex = value;

                      setState(() {});
                    },
                    itemBuilder: (context, index) {
                      final story = widget.stories[index];
                      switch (story.media) {
                        case MediaType.image:
                          return Image(image: NetworkImage(story.url,));
                        case MediaType.video:
                          return StoryVideoView(storyModel: story);
                      }
                    },
                    itemCount: widget.stories.length,
                  ),
                  Positioned(
                      top: 60,
                      left: 10,
                      right: 10,
                      child: Row(
                          children: widget.stories
                              .map((e) => AnimatedBar(
                                  animController: _animationController,
                                  position: widget.stories.indexOf(e),
                                  currentIndex: _currentIndex))
                              .toList())),
                  //Todo:hande this
                  Positioned(
                    top: 80,
                    left: 10,
                    right: 0,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            story.user.profileImageUrl,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(story.user.name,style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 30)),
                        const SizedBox(
                          width: 10,
                        ),
                         Text("1h",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white.withOpacity(0.6),fontSize: 20),),
                        const Spacer(),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Iconsax.more,color: Colors.white,))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: ()
                    {
                      isLoved=!isLoved;
                      setState(() {
                      });
                    },
                    icon:  Icon(
                      isLoved?Iconsax.heart:Iconsax.heart5,
                      color: Colors.blueAccent,
                    ),
                  ),
                   Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                    hintText: 'Write a comment',
                    contentPadding: EdgeInsets.only(bottom: 12, right: 10),
                  ))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onTapDown(TapDownDetails details, Story story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;




    if (dx < screenWidth / 3) {
      if(widget.stories[_currentIndex].controller != null){
        widget.stories[_currentIndex].controller?.seekTo(const Duration(seconds: 0));
        widget.stories[_currentIndex].controller?.pause();
      }
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadStory(story: widget.stories[_currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      if(widget.stories[_currentIndex].controller != null){
        widget.stories[_currentIndex].controller?.seekTo(const Duration(seconds: 0));
        widget.stories[_currentIndex].controller?.pause();
      }
      setState(() {
        if (_currentIndex + 1 < widget.stories.length) {
          _currentIndex += 1;
          _loadStory(story: widget.stories[_currentIndex]);
        } else {
          _currentIndex = 0;
          _loadStory(story: widget.stories[_currentIndex]);
        }
      });
    } else {
      if (story.media == MediaType.video) {
        if (story.controller?.value.isPlaying ?? false) {
          story.controller?.pause();
          _animationController.stop();
        } else {
          story.controller?.play();
          _animationController.forward();
        }
      } else {
        if (_animationController.isAnimating) {
          _animationController.stop();
        } else {
          _animationController.forward();
        }
      }
    }
  }

  Future<void> _loadStory({Story? story, bool animateToPage = true}) async {
    _animationController.stop();
    _animationController.reset();
    if (story?.controller != null) {
      story?.controller?.pause();
      story?.controller?.seekTo(Duration.zero);
    }
    switch (story?.media) {
      case MediaType.image:
        _animationController.duration = story?.duration;
        _animationController.forward();
        break;
      case MediaType.video:
        try{
          if (!(story?.controller?.value.isInitialized ?? false)) {
            story?.controllerState.value = ControllerLoadingState();
            story?.controller =  VideoPlayerController.networkUrl(Uri.parse(story.url ?? ''));
            await story?.controller?.initialize();
            story?.controllerState.value = ControllerInitializedState();
          }
          _animationController.duration =
              story?.controller?.value.duration;

          if(_currentIndex == _pageController.page?.toInt()){
            story?.controller?.play();
          }


          _animationController.forward();
          setState(() {});

        }catch(errorMessage){
          story?.controllerState.value = ControllerErrorState(errorMessage: "error when initializing the controller");

        }

        break;
      case null:
    }
    if (animateToPage) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}
