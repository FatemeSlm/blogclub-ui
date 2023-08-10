import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeData.colorScheme.background.withOpacity(0),
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(32, 0, 32, 64),
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.1))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Assets.img.stories.story8
                                    .image(width: 75, height: 75)),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('@joviedan'),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Jovi Daniel',
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'UX Designer',
                                    style: themeData.textTheme.bodyText1!.apply(
                                        color: themeData.colorScheme.primary),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'About me',
                          style: themeData.textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                          style: themeData.textTheme.bodyText1!
                              .copyWith(fontWeight: FontWeight.w200),
                        ),
                        const SizedBox(
                          height: 24,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 30,
                    left: 105,
                    right: 105,
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 30,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.8))
                      ]),
                    )),
                Positioned(
                  bottom: 32,
                  left: 74,
                  right: 74,
                  child: Container(
                    height: 62,
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff2151cd),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '52',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: themeData.colorScheme.onPrimary,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Post',
                                  style: themeData.textTheme.bodyText2!.copyWith(
                                      color: themeData.colorScheme.onPrimary,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '250',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: themeData.colorScheme.onPrimary,
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Following',
                                style: themeData.textTheme.bodyText2!.copyWith(
                                    color: themeData.colorScheme.onPrimary,
                                    fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.5K',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: themeData.colorScheme.onPrimary,
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Followers',
                                style: themeData.textTheme.bodyText2!.copyWith(
                                    color: themeData.colorScheme.onPrimary,
                                    fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          'My Posts',
                          style: themeData.textTheme.headline6,
                        )),
                        IconButton(
                            onPressed: () {}, icon: Assets.img.icons.grid.svg()),
                        IconButton(
                            onPressed: () {}, icon: Assets.img.icons.table.svg()),
                      ],
                    ),
                  ),
                  for (var i = 0; i < posts.length; i++)
                    Post(
                      post: posts[i],
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
