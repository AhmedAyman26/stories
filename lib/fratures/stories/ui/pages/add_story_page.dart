import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:stories_viewer_app/media_picker.dart';

class CreateStoryPage extends StatefulWidget {
  static String routeName='CreateStoryPage';
  const CreateStoryPage({Key? key}) : super(key: key);

  @override
  State<CreateStoryPage> createState() => _CreateStoryPageState();
}

class _CreateStoryPageState extends State<CreateStoryPage> {
  PhotoViewController controller=PhotoViewController();
  String? selectedImage;
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:
          [
            const Text('Add story'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    height: 180,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children:
                      [
                        InkWell(
                          child: Container(
                            color: Colors.pinkAccent,
                            width: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  child: Icon(Icons.image),
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                ),
                                Text('Image',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 30),)
                              ],
                            ),
                          ),
                          onTap: ()
                          {
                            MediaPicker.pickSingleImageFromGallery((attachment)
                            {
                               selectedImage=attachment.url!;
                               setState(() {

                               });
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          color: Colors.greenAccent,
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                child: Icon(Icons.music_note),
                                backgroundColor: Colors.white,
                                radius: 20,
                              ),
                              Text('Music',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 30),)
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          color: Colors.purple,
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                child: Icon(Icons.videocam_rounded),
                                backgroundColor: Colors.white,
                                radius: 20,
                              ),
                              Text('Bommerang',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 30),)
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          color: Colors.amber,
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                child: Icon(Icons.face_outlined),
                                backgroundColor: Colors.white,
                                radius: 20,
                              ),
                              Text('Selfie',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 30),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: PhotoView(controller: controller,
                enablePanAlways: true,
                onTapDown: (context, details, controllerValue) {
                  print(controllerValue.position);
                },
                backgroundDecoration: BoxDecoration(
                  color: Theme.of(context).canvasColor
                ),
                enableRotation: true,
                minScale: PhotoViewComputedScale.contained*0.8,
                imageProvider: FileImage(File(selectedImage??'')),
              ),
            )
          ],
        ),
      ),
    );
  }
}

