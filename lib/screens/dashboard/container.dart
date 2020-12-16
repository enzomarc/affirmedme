import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kronosme/providers/goal_provider.dart';
import 'package:kronosme/screens/dashboard/home.dart';
import 'package:kronosme/screens/lists/screen.dart';
import 'package:kronosme/services/auth_service.dart';
import 'package:kronosme/services/goal_service.dart';
import 'package:kronosme/widgets/menu_button.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Widget> screens = [
    DashboardHome(),
    ListScreen(),
  ];

  Widget currentScreen;
  String username = "";
  String type;
  final PageStorageBucket bucket = PageStorageBucket();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void loadInfo() async {
    final goalProvider = Provider.of<GoalProvider>(context, listen: false);

    await goalService.getGoals();
    goalProvider.getGoals();
  }

  @override
  void initState() {
    loadInfo();
    username = auth.username;
    type = auth.accountType;
    currentScreen = screens[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                color: Color(0xFFFAF6F5),
                height: 110.0,
                child: Image.asset(
                  'assets/images/logo.png',
                  scale: 15.0,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    MenuButton(
                      label: 'Dashboard',
                      icon: Icons.dashboard,
                      callback: () {
                        setState(() {
                          currentScreen = screens[0];
                        });

                        Navigator.pop(context);
                      },
                    ),
                    MenuButton(
                      label: 'To do List',
                      icon: Icons.add,
                      callback: () {
                        setState(() {
                          currentScreen = screens[1];
                        });

                        Navigator.pop(context);
                      },
                    ),
                    MenuButton(
                      label: 'My Account',
                      icon: Icons.person,
                      callback: () {
                        setState(() {
                          currentScreen = screens[1];
                        });
                      },
                    ),
                    MenuButton(
                      label: 'Upgrade to Premium',
                      icon: Icons.star,
                      callback: () {
                        setState(() {
                          currentScreen = screens[1];
                        });
                      },
                    ),
                    MenuButton(
                      label: 'Donate',
                      icon: Icons.bookmark,
                      callback: () {
                        setState(() {
                          currentScreen = screens[1];
                        });
                      },
                    ),
                    MenuButton(
                      label: 'Help',
                      icon: Icons.info_outline,
                      callback: () {
                        setState(() {
                          currentScreen = screens[1];
                        });
                      },
                    ),
                    MenuButton(
                      label: 'Settings',
                      icon: Icons.settings,
                      callback: () {
                        setState(() {
                          currentScreen = screens[1];
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                color: Colors.grey.withOpacity(0.2),
                child: Row(
                  children: [
                    Icon(
                      Icons.compare_arrows,
                      color: Color(0xFFFE0000),
                    ),
                    SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: () async {
                        await auth.logout();
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            fontFamily: 'Montserrat Medium', fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0.5),
                      color: Colors.black12,
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Color(0xFFFE0000),
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.account_circle,
                            color: Color(0xFFFE0000),
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 100.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Hi! $username',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Montserrat Medium',
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                type == 'basic' ? 'Basic Pack' : 'Premium Pack',
                                style: TextStyle(
                                  fontFamily: 'Montserrat Medium',
                                  fontSize: 13.0,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.0),
                        IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.black54,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              flex: 12,
              child: PageStorage(
                bucket: bucket,
                child: currentScreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
