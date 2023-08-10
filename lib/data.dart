class StoryData {
  final int id;
  final String name;
  final String imageFileName;
  final String iconFileName;
  final bool isViewed;

  StoryData(
      {required this.id,
      required this.name,
      required this.imageFileName,
      required this.iconFileName,
      required this.isViewed});
}

class Category {
  final int id;
  final String title;
  final String imageFileName;

  Category(
      {required this.id, required this.title, required this.imageFileName});
}

class PostData {
  final int id;
  final String caption;
  final String title;
  final String likes;
  final String time;
  final bool isBookmarked;
  final String imageFileName;

  PostData(
      {required this.id,
      required this.caption,
      required this.title,
      required this.likes,
      required this.time,
      required this.isBookmarked,
      required this.imageFileName});
}

class AppDatabase {
  static List<StoryData> get stories {
    return [
      StoryData(
          id: 1001,
          name: 'Emilia',
          imageFileName: 'story_9.jpg',
          iconFileName: 'category_1.png',
          isViewed: false),
      StoryData(
          id: 1002,
          name: 'Richard',
          imageFileName: 'story_10.jpg',
          iconFileName: 'category_2.png',
          isViewed: false),
      StoryData(
          id: 1003,
          name: 'Jasmine',
          imageFileName: 'story_1.jpg',
          iconFileName: 'category_3.png',
          isViewed: true),
      StoryData(
          id: 1004,
          name: 'Lucas',
          imageFileName: 'story_3.jpg',
          iconFileName: 'category_4.png',
          isViewed: false),
      StoryData(
          id: 1005,
          name: 'Isabella',
          imageFileName: 'story_4.jpg',
          iconFileName: 'category_2.png',
          isViewed: false),
      StoryData(
          id: 1006,
          name: 'Olivia',
          imageFileName: 'story_6.jpg',
          iconFileName: 'category_1.png',
          isViewed: false),
      StoryData(
          id: 1007,
          name: 'Amelia',
          imageFileName: 'story_7.jpg',
          iconFileName: 'category_4.png',
          isViewed: false),
      StoryData(
          id: 1008,
          name: 'Grace',
          imageFileName: 'story_2.jpg',
          iconFileName: 'category_3.png',
          isViewed: false),
    ];
  }

  static List<Category> get categories {
    return [
      Category(
        id: 101,
        title: 'Technology',
        imageFileName: 'large_post_1.jpg',
      ),
      Category(id: 102, title: 'Cinema', imageFileName: 'large_post_2.jpg'),
      Category(
          id: 103, title: 'Transportation', imageFileName: 'large_post_3.jpg'),
      Category(id: 104, title: 'Adventure', imageFileName: 'large_post_4.jpg'),
      Category(
          id: 105,
          title: 'Artificial Intelligence',
          imageFileName: 'large_post_5.jpg'),
      Category(id: 106, title: 'Economy', imageFileName: 'large_post_6.jpg'),
    ];
  }

  static List<PostData> get posts {
    return [
      PostData(
          id: 1,
          title: 'BMW M5 Competition Review 2021',
          caption: 'TOP GEAR',
          isBookmarked: false,
          likes: '3.1k',
          time: '1hr ago',
          imageFileName: 'small_post_1.jpg'),
      PostData(
          id: 0,
          title: 'MacBook Pro with M1 Pro and M1 Max review',
          caption: 'THE VERGE',
          isBookmarked: false,
          likes: '1.2k',
          time: '2hr ago',
          imageFileName: 'small_post_2.jpg'),
      PostData(
          id: 2,
          title: 'Step design sprint for UX beginner',
          caption: 'Ux Design',
          isBookmarked: true,
          likes: '2k',
          time: '41hr ago',
          imageFileName: 'small_post_3.jpg'),
    ];
  }

  static List<OnBoardingItem> get onBoardingItems {
    List<OnBoardingItem> items = [];
    for (var i = 0; i < 4; i++) {
      items.add(OnBoardingItem('Read the article you want instantly',
          'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.'));
    }
    return items;
  }
}

class OnBoardingItem {
  final String title;
  final String description;

  OnBoardingItem(this.title, this.description);
}
