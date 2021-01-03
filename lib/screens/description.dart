import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kronosme/services/auth_service.dart';

class DescriptionPage extends StatefulWidget {
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFFE0000)));

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: Colors.white,
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.skip_next,
                ),
                title: Text(
                  'Skip',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(
                    Icons.skip_next,
                    color: Color(0xFFFE0000),
                  ),
                  onPressed: () async {
                    bool connected = await auth.check();

                    if (!connected)
                      Navigator.pushNamed(context, '/login');
                    else
                      Navigator.pop(context);
                  },
                ),
                title: Text(
                  'Skip',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFFFE0000),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Color(0xFFFE0000),
            ),
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    margin: EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/logo_light.png',
                            height: 60.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'THANK YOU FOR HELPING US GIVE BACK!',
                          style: TextStyle(
                            fontFamily: 'Monserrat Bold',
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'For every copy of this app sold, a percentage of funds will go to the FIGHT AGAINST human trafficking. It is our goal to put power back in the hands of those who have been robbed of their inherent right to live freely without fear.',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 30.0,
                      left: 10.0,
                      right: 10.0,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'WHY',
                          style: TextStyle(
                            fontFamily: 'Montserrat Bold',
                            fontSize: 11.0,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Everything AFFIRMED ME does is derived from our belief in the human desire to become the BEST version of ourselves through SELF-DISCIPLINE on the path to GREATNESS, as defined by each individual. We help to ease your journey by providing a MASTER plan with ACTIONS, reminders, techniques, and tips consolidated from the most EFFECTIVE leaders and people of our time. The information KRONOS provides will save you considerable amounts of TIME and MONEY, allowing you to take COMMAND of your LIFE through practiced discipline, accountability, and preparedness. The result is living a life that sews the seeds for success and an abundance of CREATIVE expression, shaping the lives of those around you in positive way—giving back to the world.',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 10.0,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'OVERALL DESCRIPTION',
                              style: TextStyle(
                                fontFamily: 'Montserrat Bold',
                                fontSize: 11.0,
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  WrapDescribe(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Key Functions',
                              style: TextStyle(
                                fontFamily: 'Montserrat Bold',
                                fontSize: 11.0,
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  WrapDescribe(
                                    title:
                                        'Provides a list of key cyclical events and reminders to keep you ahead of schedule.',
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  WrapDescribe(
                                    title:
                                        'Provides the framework to live a balanced life through all the facets of health: mindfulness, fitness, and relationship wellness. ',
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  WrapDescribe(
                                    title:
                                        'Provides updates to content in the form of new weekly tips, reminders, calendar events, and checklists. ',
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  WrapDescribe(
                                    title:
                                        'Recommends and connects you to experts, businesses, and services to help you complete tasks, giving you time back by easing your planning process. ',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'HIGHLIGHTS',
                              style: TextStyle(
                                fontFamily: 'Montserrat Bold',
                                fontSize: 11.0,
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  WrapDescribe(
                                    title:
                                        'User can auto-populate their phone’s organic calendar app with the recommended calendar events and reminders with the click of a button, to allow personalized synchronization.',
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  WrapDescribe(
                                    title:
                                        'The first major update will recommend experts, businesses, and services to help you save time and complete specific tasks, events, and objectives and will further provide short video clips of inside tips and techniques from local, regional, and national industry leaders to help you complete specific life-planning objectives.',
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WrapDescribe extends StatelessWidget {
  const WrapDescribe({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          height: 5.0,
          width: 5.0,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Color(0xFFFE0000),
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        Text(
          title ??
              'An application which helps you streamline your life by putting key calendar events, reminders, techniques, and tips at your fingers. The application further provides a planning model to help you organize your thoughts while preparing for any event, big or small.',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 10.0,
          ),
        ),
      ],
    );
  }
}
