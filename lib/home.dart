import 'package:blogclub/article.dart';
import 'package:blogclub/carousel/carousel_slider.dart';
import 'package:blogclub/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'gen/assets.gen.dart';
import 'gen/fonts.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).textTheme;
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Jonathan!',
                      style: themeData.subtitle1,
                    ),
                    Assets.img.icons.notification.image(width: 32, height: 32)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8, 0, 16),
                child: Text('Explore today,s', style: themeData.headline4),
              ),
              _StoryList(stories: stories, themeData: themeData),
              const SizedBox(
                height: 16,
              ),
              const _CategoryList(),
              const _PostList(),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    Key? key,
    required this.stories,
    required this.themeData,
  }) : super(key: key);

  final List<StoryData> stories;
  final TextTheme themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 95,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return _Story(story: story, themeData: themeData);
        },
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    Key? key,
    required this.story,
    required this.themeData,
  }) : super(key: key);

  final StoryData story;
  final TextTheme themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _profileImageViewd() : _profileImageNormal(),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/img/icons/${story.iconFileName}',
                  width: 24,
                  height: 24,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            story.name,
            style: themeData.bodyText2,
          ),
        ],
      ),
    );
  }

  Container _profileImageNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB),
          ])),
      child: Container(
        padding: const EdgeInsets.all(5),
        child: _profileImage(),
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(22)),
      ),
    );
  }

  Widget _profileImageViewd() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        color: const Color(0xff7B8BB2),
        dashPattern: const [7, 3],
        radius: const Radius.circular(24),
        padding: const EdgeInsets.all(7),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Image.asset('assets/img/stories/${story.imageFileName}'));
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) {
        return _CategoryItem(
          category: categories[realIndex],
          left: realIndex == 0 ? 32 : 8,
          right: realIndex == categories.length - 1 ? 32 : 8,
        );
      },
      options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          viewportFraction: 0.8,
          aspectRatio: 1.2,
          disableCenter: true,
          scrollPhysics: const BouncingScrollPhysics(),
          enableInfiniteScroll: false,
          initialPage: 0,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;
  final double left;
  final double right;
  const _CategoryItem({
    Key? key,
    required this.category,
    required this.left,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          Positioned.fill(
              top: 100,
              right: 65,
              left: 65,
              bottom: 24,
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(blurRadius: 20, color: Color(0xaa0D253C))
                ]),
              )),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                  fit: BoxFit.cover,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
              ),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                      end: Alignment.center,
                      begin: Alignment.bottomCenter,
                      colors: [
                        Color(0xff0D253C),
                        Colors.transparent,
                      ])),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 32,
            child: Text(
              category.title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .apply(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Latest news',
                style: Theme.of(context).textTheme.headline5,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'More',
                    style: TextStyle(color: Color(0xff376AED)),
                  ))
            ],
          ),
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            final post = posts[index];
            return Post(post: post);
          },
          itemCount: posts.length,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemExtent: 141,
        ),
      ],
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostData post;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ArticleScreen())),
      child: Container(
        margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(blurRadius: 10, color: Color(0x1a5282ff))
            ]),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child:
                    Image.asset('assets/img/posts/small/${post.imageFileName}',
                    width: 120,)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.caption,
                      style: const TextStyle(
                          fontFamily: FontFamily.avenir,
                          color: Color(0xff376AED),
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      post.title,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          CupertinoIcons.hand_thumbsup,
                          size: 16,
                          color: Theme.of(context).textTheme.bodyText2!.color,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          post.likes,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Icon(
                          CupertinoIcons.clock,
                          size: 16,
                          color: Theme.of(context).textTheme.bodyText2!.color,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          post.time,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              post.isBookmarked
                                  ? CupertinoIcons.bookmark_fill
                                  : CupertinoIcons.bookmark,
                              size: 16,
                              color: Theme.of(context).textTheme.bodyText2!.color,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}