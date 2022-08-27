import 'package:cryptosplit/Globals/globals.dart';
import 'package:cryptosplit/Screens/Dashboard/dashboard.dart';
import 'package:cryptosplit/Screens/add%20data/add_data.dart';
import 'package:cryptosplit/Screens/viewstats/view_stats.dart';
import 'package:cryptosplit/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int access = 100;

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      backgroundColor: Color.fromRGBO(64, 60, 92, 1),
      appBar: isSmallScreen
          ? AppBar(
              backgroundColor: canvasColor,
              title: Text(_getTitleByIndex(_controller.selectedIndex)),
              leading: IconButton(
                onPressed: () {
                  _controller.setExtended(true);
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
          : null,
      drawer: ExampleSidebarX(controller: _controller),
      body: Row(
        children: [
          if (!isSmallScreen) ExampleSidebarX(controller: _controller),
          Expanded(
            child: Center(
              child: _ScreensExample(
                controller: _controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
        controller: _controller,
        theme: SidebarXTheme(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromRGBO(40, 36, 60, 1),
            borderRadius: BorderRadius.circular(20),
          ),
          textStyle: TextStyle(color: Colors.white),
          selectedTextStyle: const TextStyle(color: Colors.black87),
          itemTextPadding: const EdgeInsets.only(left: 30),
          selectedItemTextPadding: const EdgeInsets.only(left: 30),
          itemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white),
          ),
          selectedItemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white,
            ),
            gradient: const LinearGradient(
              colors: [Colors.white, Colors.white],
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(40, 36, 60, 1),
                blurRadius: 30,
              )
            ],
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 20,
          ),
          selectedIconTheme: const IconThemeData(
            color: Color.fromRGBO(40, 36, 60, 1),
            size: 20,
          ),
        ),
        extendedTheme: const SidebarXTheme(
          width: 200,
          decoration: BoxDecoration(
            color: canvasColor,
          ),
        ),
        headerBuilder: (context, extended) {
          return Column(
            children: [
              SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('assets/man.png'),
                ),
              ),
              _controller.extended
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        Globals.user.email,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : Container()
            ],
          );
        },
        items: ([
          SidebarXItem(
            icon: Icons.home,
            label: 'Home',
            onTap: () {
              debugPrint('Home');
            },
          ),
          const SidebarXItem(
            icon: Icons.analytics_outlined,
            label: 'Analyse',
          ),
          const SidebarXItem(
            icon: Icons.file_download_outlined,
            label: 'Store',
          ),
        ]));
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return Column(
              children: [
                Expanded(child: Dashboard()),
              ],
            );
          case 1:
            return Column(
              children: [
                Expanded(child: ViewStat()),
              ],
            );
          case 2:
            return Column(
              children: [
                Expanded(child: AddData()),
              ],
            );
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headline5,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Croped';
    case 2:
      return 'People';

    default:
      return 'Not found page';
  }
}

const primaryColor = Color.fromRGBO(64, 60, 92, 1);
const canvasColor = Color.fromRGBO(40, 36, 60, 1);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Colors.white;
const white = Colors.white;
