import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kronosme/providers/date_provider.dart';
import 'package:kronosme/providers/goal_provider.dart';
import 'package:kronosme/providers/meal_plan_provider.dart';
import 'package:kronosme/providers/module_provider.dart';
import 'package:kronosme/providers/planning_provider.dart';
import 'package:kronosme/providers/podcast_provider.dart';
import 'package:kronosme/providers/reminder_provider.dart';
import 'package:kronosme/screens/contacts/contact.dart';
import 'package:kronosme/screens/dashboard/home.dart';
import 'package:kronosme/screens/meals/list.dart';
import 'package:kronosme/screens/podcasts/player.dart';
import 'package:kronosme/screens/reminder/list.dart';
import 'package:kronosme/services/auth_service.dart';
import 'package:kronosme/widgets/menu_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Widget> screens = [
    DashboardHome(),
    ReminderScreen(),
    ContactScreen(),
    MealScreen(),
    PodcastPlayer(), //Podcasts(),
  ];

  Widget currentScreen;
  String username = "";
  String type;
  bool paramLoaded = false;
  final PageStorageBucket bucket = PageStorageBucket();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void loadInfo() async {
    final moduleProvider = Provider.of<ModuleProvider>(context, listen: false);
    final goalProvider = Provider.of<GoalProvider>(context, listen: false);
    final podcastProvider = Provider.of<PodcastProvider>(context, listen: false);
    final reminderProvider = Provider.of<ReminderProvider>(context, listen: false);
    final planningProvider = Provider.of<PlanningProvider>(context, listen: false);
    final dateProvider = Provider.of<DateProvider>(context, listen: false);
    final mealProvider = Provider.of<MealPlanProvider>(context, listen: false);

    // load user data here
    moduleProvider.getModules();
    goalProvider.getGoals();
    reminderProvider.getReminders();
    podcastProvider.getPodcasts();
    planningProvider.getPlannings();
    dateProvider.getDates();
    mealProvider.getMealPlans();
  }

  @override
  void initState() {
    super.initState();

    loadInfo();
    username = auth.username;
    type = auth.accountType;
    currentScreen = screens[0];
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );

    int paramScreen = ModalRoute.of(context).settings.arguments;
    if (!paramLoaded && paramScreen != null) {
      currentScreen = screens[paramScreen];
      paramLoaded = true;
    }

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
                      label: 'Reminder',
                      icon: Icons.add,
                      callback: () {
                        setState(() {
                          currentScreen = screens[1];
                        });

                        Navigator.pop(context);
                      },
                    ),
                    if (type == 'premium')
                      MenuButton(
                        label: 'Podcasts',
                        icon: Icons.mic,
                        callback: () {
                          setState(() {
                            currentScreen = screens[4];
                          });

                          Navigator.pop(context);
                        },
                      ),
                    if (type == 'basic')
                      MenuButton(
                        label: 'Upgrade to Premium',
                        icon: Icons.star,
                        callback: () {
                          Navigator.pushNamed(context, '/upgrade');
                        },
                      ),
                    MenuButton(
                      label: 'Donate',
                      icon: Icons.bookmark,
                      callback: () async {
                        const url = 'https://www.affirmedme.com';
                        if (await canLaunch(url)) await launch(url);
                      },
                    ),
                    MenuButton(
                      label: 'About us',
                      icon: Icons.info_outline,
                      callback: () {
                        Navigator.pushNamed(context, '/description');
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
                          fontFamily: 'Montserrat Medium',
                          fontSize: 16.0,
                        ),
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
