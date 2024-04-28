import 'package:flutter/material.dart';
import 'package:stories_viewer_app/fratures/stories/ui/pages/add_story_page.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final user = BlocProvider.of<UserCubit>(context).state.userData;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              InkWell(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateStoryPage()));
                },
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(16)),
                  height: 200,
                  width: 150,
                  child: Stack(
                    children: [
                      Image.network('user.data?.profileImage ?? '''),
                      const Positioned(
                        left: 0,
                        right: 0,
                        top: 105,
                        child: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          child: Icon(Icons.add),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text('Create\nstory'),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16)),
                    width: 150,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
