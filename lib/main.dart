import 'package:blogclub/Splash.dart';
import 'package:blogclub/article.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.avenir,
          )))),
          colorScheme: const ColorScheme.light(
            primary: primaryColor,
            onPrimary: Colors.white,
            surface: Colors.white,
            onSurface: primaryTextColor,
            background: Color(0xfffbfcff),
            onBackground: primaryTextColor,
          ),
          appBarTheme: const AppBarTheme(
              titleSpacing: 32,
              backgroundColor: Colors.white,
              foregroundColor: primaryTextColor),
          snackBarTheme:
              const SnackBarThemeData(backgroundColor: primaryTextColor),
          textTheme: const TextTheme(
              subtitle1: TextStyle(
                  fontFamily: FontFamily.avenir,
                  color: secondryTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w200),
              subtitle2: TextStyle(
                  fontFamily: FontFamily.avenir,
                  color: primaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              headline6: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor,
                  fontSize: 18),
              bodyText2: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 12,
                  color: secondryTextColor),
              bodyText1: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 14,
                  color: primaryTextColor),
              headline4: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 24,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w700),
              caption: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 10,
                  color: Color(0xff7b8bb2),
                  fontWeight: FontWeight.w700),
              headline5: TextStyle(
                fontFamily: FontFamily.avenir,
                fontSize: 20,
                color: primaryTextColor,
                fontWeight: FontWeight.w700,
              ))),
      // home: Stack(
      //   children: [
      //     const Positioned.fill(child: HomeScreen()),
      //     Positioned(left: 0, right: 0, bottom: 0, child: _BottomNavigation())
      //   ],
      // ),
      home: const SplashScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;
const double bottomNavigationHeight = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedTab = homeIndex;
  final List<int> _history = [];

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();
  GlobalKey<NavigatorState> _menuKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    menuIndex: _menuKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState navigatorSelectedSate =
        map[selectedTab]!.currentState!;
    if (navigatorSelectedSate.canPop()) {
      navigatorSelectedSate.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedTab = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavigationHeight,
              left: 0,
              right: 0,
              child: IndexedStack(
                index: selectedTab,
                children: [
                  _navigator(_homeKey, homeIndex, const HomeScreen()),
                  _navigator(_articleKey, articleIndex, const ArticleScreen()),
                  _navigator(_searchKey, searchIndex, const SearchScreen()),
                  _navigator(_menuKey, menuIndex, const ProfileScreen()),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _BottomNavigation(
                selectedIndex: selectedTab,
                onTap: (index) {
                  _history.remove(selectedTab);
                  _history.add(selectedTab);
                  setState(() {
                    selectedTab = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget widget) {
    return key.currentState == null && selectedTab != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) =>
                    Offstage(offstage: selectedTab != index, child: widget)));
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search Screen',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;

  const _BottomNavigation(
      {Key? key, required this.onTap, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: bottomNavigationHeight,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: const Color(0xff9B8487).withOpacity(0.3))
              ]),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomNavigationItem(
                      iocnFileName: 'Home.png',
                      activeIocnFileName: 'HomeActive.png',
                      title: 'Home',
                      isActive: selectedIndex == homeIndex,
                      onTap: () {
                        onTap(homeIndex);
                      },
                    ),
                    BottomNavigationItem(
                      iocnFileName: 'Articles.png',
                      activeIocnFileName: 'ArticlesActive.png',
                      title: 'Articles',
                      isActive: selectedIndex == articleIndex,
                      onTap: () {
                        onTap(articleIndex);
                      },
                    ),
                    Expanded(child: Container()),
                    BottomNavigationItem(
                      iocnFileName: 'Search.png',
                      activeIocnFileName: 'SearchActive.png',
                      title: 'Search',
                      isActive: selectedIndex == searchIndex,
                      onTap: () {
                        onTap(searchIndex);
                      },
                    ),
                    BottomNavigationItem(
                      iocnFileName: 'Menu.png',
                      activeIocnFileName: 'MenuActive.png',
                      title: 'Profile',
                      isActive: selectedIndex == menuIndex,
                      onTap: () {
                        onTap(menuIndex);
                      },
                    )
                  ]),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.topCenter,
              width: 65,
              height: 85,
              child: Container(
                width: 65,
                height: 65,
                child: Image.asset('assets/img/icons/plus.png'),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 4),
                    borderRadius: BorderRadius.circular(32.5),
                    color: const Color(0xff376AED)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iocnFileName;
  final String activeIocnFileName;
  final String title;
  final bool isActive;
  final Function() onTap;

  const BottomNavigationItem(
      {Key? key,
      required this.iocnFileName,
      required this.activeIocnFileName,
      required this.title,
      required this.onTap,
      required this.isActive})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/icons/${isActive ? activeIocnFileName : iocnFileName}',
              width: 24,
              height: 24,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: themeData.textTheme.caption!.apply(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.textTheme.caption!.color),
            )
          ],
        ),
      ),
    );
  }
}
