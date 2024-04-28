// import 'package:flutter/material.dart';
// import 'package:rigow_flutter/core/utils/app_dimensions/dimensions.dart';
// import 'package:rigow_flutter/core/utils/app_material/app_svg/app_svg.dart';
// import 'package:rigow_flutter/core/utils/constants/app_colors.dart';
// import 'package:rigow_flutter/core/utils/constants/icons_paths.dart';
// import 'package:rigow_flutter/core/utils/constants/text_styles.dart';
// import 'package:rigow_flutter/shared_features/reels/domain/entities/video_entity.dart';
// import 'package:rigow_flutter/shared_features/stories/domain/entities/story_model.dart';
// import 'package:stories_viewer_app/fratures/stories/domain/entities/story_model.dart';
// import 'package:stories_viewer_app/fratures/stories/domain/video_entity.dart';
// import 'package:video_player/video_player.dart';
//
// class StoryVideoView extends StatelessWidget {
//   final Story storyModel;
//   const StoryVideoView({super.key, required this.storyModel});
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: storyModel.controllerState,
//       builder: (context, controllerState, child) {
//         if(controllerState is ControllerErrorState){
//           return Text(controllerState.errorMessage,style: TextStyles.medium(color: AppColors.appBackgroundColor),);
//         }
//         else if(controllerState is ControllerInitializedState && (storyModel.controller?.value.isInitialized ?? false)){
//           return Column(
//             children: [
//               Expanded(
//                 child: AspectRatio(
//                   aspectRatio: storyModel.controller!.value.aspectRatio,
//                   child: VideoPlayer(storyModel.controller!),
//                 ),
//               ),
//             ],
//           );
//         }
//         return ColoredBox(
//           color: Colors.black,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // const AppSvg(imagePath: IconsPaths.appLogo),
//               SizedBox(height: PaddingDimensions.normal,),
//               Center(
//                 child: Text("Loading",style: TextStyles.regular(color: Colors.white),),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
