import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'package:stories_viewer_app/attachment.dart';
import 'package:stories_viewer_app/get_thumbnail_from_video_usecase.dart';

typedef PickedMediaCallback = void Function(Attachment item);

typedef PickedMultipleMediaCallback = void Function(List<Attachment> items);

class MediaPicker {
  static final _picker = ImagePicker();

  static Future<void> onPickImagesFromGallery(
      PickedMultipleMediaCallback pickedMultipleMediaCallback) async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(imageQuality: 60);
      if (images.isNotEmpty) {
        pickedMultipleMediaCallback(images
            .map((e) =>
                Attachment(url: e.path, attachmentType: AttachmentType.PHOTO))
            .toList());
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  static Future<void> pickSingleImageFromGallery(
      Function(Attachment attachment) pickedMediaCallback) async {
    try {
      final XFile? image = await _picker.pickImage(
          imageQuality: 60, source: ImageSource.gallery);

      if (image != null && image.path.isNotEmpty) {
        pickedMediaCallback(
            Attachment(attachmentType: AttachmentType.PHOTO, url: image.path));
        return;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static void onPickImageFromCamera(
      PickedMediaCallback pickedMediaCallback) async {
    final image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 60
    );
    log('------image${image?.path}');

    if (image != null) {
      pickedMediaCallback(
          Attachment(url: image.path, attachmentType: AttachmentType.PHOTO));
    }
  }

  static void onPickVideoFromGallery(
      PickedMediaCallback pickedMediaCallback) async {
    final video = await _picker.pickVideo(
      source: ImageSource.gallery,
    );
    if (video != null) {
      final fileName =
          await GetVideoThumbnailUseCase().call(videoPath: video.path);

      pickedMediaCallback(Attachment(
          url: video.path,
          attachmentType: AttachmentType.VIDEO,
          thumbnail: fileName));
    }
  }

  static void onPickVideoFromCamera(
      PickedMediaCallback pickedMediaCallback) async {
    final video = await _picker.pickVideo(
      source: ImageSource.camera,
    );
    if (video != null) {
      final fileName =
          await GetVideoThumbnailUseCase().call(videoPath: video.path);
      pickedMediaCallback(Attachment(
          url: video.path,
          attachmentType: AttachmentType.VIDEO,
          thumbnail: fileName));
    }
  }

}
