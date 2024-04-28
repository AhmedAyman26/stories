import 'package:stories_viewer_app/exceptions.dart';
import 'package:video_thumbnail/video_thumbnail.dart';


class GetVideoThumbnailUseCase{

  Future<String> call({required String videoPath})async {

    final thumbnail = await VideoThumbnail.thumbnailFile(
        video: videoPath, imageFormat: ImageFormat.JPEG,quality: 75);

    if (thumbnail == null) {
      throw GenerateThumbnailException();
    }else{
      return thumbnail;
    }

  }
}