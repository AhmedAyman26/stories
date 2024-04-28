import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoEntity {
  String id;
  String user;
  String userPic;
  String videoTitle;
  String songName;
  int likes;
  int comments;
  String url;

  VideoPlayerController? controller;
  final ValueNotifier<ControllerState> controllerState = ValueNotifier<ControllerState>(ControllerInitialState());

  VideoEntity({
    required this.id,
    required this.user,
    required this.userPic,
    required this.videoTitle,
    required this.songName,
    required this.likes,
    required this.comments,
    required this.url,
  });

  factory VideoEntity.fromJson(Map<dynamic, dynamic> json){
    return VideoEntity(
      id : json['id'],
      user : json['user'],
      userPic : json['user_pic'],
      videoTitle : json['video_title'],
      songName : json['song_name'],
      likes : json['likes'],
      comments : json['comments'],
      url : json['url']
    );
  }

}

abstract class ControllerState{}

class ControllerInitialState extends ControllerState{}

class ControllerLoadingState extends ControllerState{}

class ControllerInitializedState extends ControllerState{}

class ControllerErrorState extends ControllerState{
  final String errorMessage;
  ControllerErrorState({required this.errorMessage});
}