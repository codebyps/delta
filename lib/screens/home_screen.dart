import 'package:answer_it/features/Chat/screens/chat_screen.dart';
import 'package:answer_it/features/imageGeneration/screens/Image_screen.dart';
import 'package:answer_it/utils/colors.dart';
import 'package:answer_it/utils/global_vars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colours.darkScaffoldColor,
        appBar: AppBar(
          backgroundColor: Colours.darkScaffoldColor,
          actions: [
            PopupMenuButton(
              iconSize: 30,
              icon: Icon(
                Icons.more_vert,
                size: 30,
                color: Colours.textColor,
              ),
              tooltip: 'Menu',
              color: Colours.darkScaffoldColor,
              splashRadius: 50,
              padding: const EdgeInsets.only(right: 5, left: 5),
              enableFeedback: true,
              position: PopupMenuPosition.under,
              offset: Offset(0.0, 10),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              itemBuilder: (context) {
                return {'Credits', 'Feedback'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice,
                        style: TextStyle(
                          color: Colours.textColor,
                        )),
                  );
                }).toList();
              },
              onSelected: (choice) {
                if (choice == 'Credits') {
                  Get.toNamed(
                    '/credits',
                  );
                } else if (choice == 'Feedback') {
                  Get.toNamed(
                    '/feedback',
                  );
                }
              },
            ),
          ],
          leading: InkWell(
            onTap: () => Get.toNamed(
              '/credits',
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: 'ico',
                child: CircleAvatar(
                  backgroundImage: AssetImage(Globals.ico),
                  radius: 28,
                ),
              ),
            ),
          ),
          title: Text(
            'Answer it',
            style: TextStyle(
              wordSpacing: 2,
              letterSpacing: 2,
              color: Colours.textColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'header',
            ),
          ),
          centerTitle: true,
          elevation: 10,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'AI Image',
              ),
              Tab(
                text: 'AI Chat',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ImageGenScreen(),
            ChatScreen(),
          ],
        ),
      ),
    );
  }
}