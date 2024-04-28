class Attachment {
  String? url;
  String? thumbnail;
  int? durationInSec;
  AttachmentType? attachmentType;

  Attachment({
    this.url,
    this.thumbnail,
    this.durationInSec,
    this.attachmentType,
  });

  Attachment modify({
    String? url,
    String? thumbnail,
    int? durationInSec,
    AttachmentType? attachmentType,
  }) {
    return Attachment(
      url: url ?? this.url,
      thumbnail: thumbnail ?? this.thumbnail,
      durationInSec: durationInSec ?? this.durationInSec,
      attachmentType: attachmentType ?? this.attachmentType,
    );
  }

  @override
  String toString() {
    return 'Attachment{url: $url, thumbnail: $thumbnail, durationInSec: $durationInSec, attachmentType: $attachmentType}';
  }
}

// ignore: constant_identifier_names
enum AttachmentType { DOCUMENT, VIDEO, PHOTO, SOUND, EMPTY }
