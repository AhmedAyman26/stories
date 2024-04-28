import 'package:flutter/material.dart';
import 'package:stories_viewer_app/fratures/stories/domain/entities/story_user_model.dart';
import 'package:stories_viewer_app/fratures/stories/domain/video_entity.dart';
import 'package:video_player/video_player.dart';
enum MediaType {
  image,
  video,
}

class Story {
  final String url;
  final MediaType media;
  final Duration duration;
  final StoryUserModel user;


  VideoPlayerController? controller;
  final ValueNotifier<ControllerState> controllerState = ValueNotifier<ControllerState>(ControllerInitialState());

  Story({
    required this.url,
    required this.media,
    required this.duration,
    required this.user,
  });

  dispose(){
    if(controller != null){
      controller?.dispose();
      controllerState.dispose();
      controller = null;
    }
  }

}