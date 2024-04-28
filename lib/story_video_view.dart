import 'package:flutter/material.dart';
import 'package:stories_viewer_app/fratures/stories/domain/entities/story_model.dart';
import 'package:stories_viewer_app/fratures/stories/domain/video_entity.dart';
import 'package:video_player/video_player.dart';

class StoryVideoView extends StatelessWidget {
  final Story storyModel;
  const StoryVideoView({super.key, required this.storyModel});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: storyModel.controllerState,
      builder: (context, controllerState, child) {
        if(controllerState is ControllerErrorState){
          return Text(controllerState.errorMessage,style: TextStyle(fontWeight: FontWeight.w600,color: Colors.grey),);
        }
        else if(controllerState is ControllerInitializedState && (storyModel.controller?.value.isInitialized ?? false)){
          return Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: storyModel.controller!.value.aspectRatio,
                  child: VideoPlayer(storyModel.controller!),
                ),
              ),
            ],
          );
        }
        return ColoredBox(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const AppSvg(imagePath: IconsPaths.appLogo),
              SizedBox(height: 20,),
              Center(
                child: Text("Loading",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
              ),
            ],
          ),
        );
      },
    );
  }
}
