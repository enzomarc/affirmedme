import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:kronosme/core/models/date.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/providers/date_provider.dart';
import 'package:kronosme/services/date_service.dart';
import 'package:provider/provider.dart';

class DateScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

DateTime scheduledAt = DateTime.now();

class _ListScreenState extends State<DateScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context, listen: false);
    dateProvider.getDates();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            margin: EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Important Dates',
                  style: TextStyle(
                    fontFamily: 'Montserrat Bold',
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  width: 120.0,
                  child: RaisedButton(
                    onPressed: () {
                      TextEditingController labelController =
                          TextEditingController();
                      showDialog(
                        context: context,
                        child: SimpleDialog(
                          title: Text('Add Important Date'),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          children: <Widget>[
                            TextFormField(
                              controller: labelController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Date Label',
                                hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.8),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 15.0),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.0,
                                    color: Color(0xFFFE0000).withOpacity(0.4),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.0,
                                    color: Color(0xFFFE0000).withOpacity(0.4),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.0,
                                    color: Color(0xFFFE0000),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            RaisedButton(
                              onPressed: () {
                                DatePicker.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  currentTime: scheduledAt ??
                                      DateTime.now().add(Duration(days: 1)),
                                  onChanged: (time) {
                                    setState(() {
                                      scheduledAt = time;
                                    });
                                  },
                                );
                              },
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    Icons.date_range,
                                    color: Color(0xFFFE0000),
                                    size: 20.0,
                                  ),
                                  Text(
                                    "${scheduledAt.year}/${scheduledAt.month}/${scheduledAt.day}" ??
                                        'Choose date and time',
                                    style: TextStyle(
                                      color: Color(0xFFFE0000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.0),
                            RaisedButton(
                              onPressed: () async {
                                if (labelController.text.isNotEmpty) {
                                  Map<String, dynamic> data = {
                                    'label': labelController.text,
                                    'at': scheduledAt.toString(),
                                  };

                                  await dateService
                                      .storeDate(data)
                                      .then((saved) {
                                    if (saved) {
                                      Navigator.of(context).pop();
                                      helpers.alert(scaffoldKey,
                                          "Date added successfully.");
                                      dateProvider.getDates();
                                    } else {
                                      helpers.alert(scaffoldKey,
                                          "Unable to save this date.");
                                    }
                                  });
                                } else
                                  helpers.alert(
                                      scaffoldKey, "Title is missing.");
                              },
                              color: Color(0xFFFE0000),
                              child: Text(
                                'Save',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          color: Color(0xFFFE0000),
                          size: 20.0,
                        ),
                        Text(
                          'Add Date',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xFFFE0000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<DateProvider>(
              builder: (context, provider, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ListView.builder(
                      itemCount: provider.dates.length,
                      itemBuilder: (context, index) {
                        Date date = provider.dates[index];

                        return DateWidget(
                            date: date,
                            scaffoldKey: scaffoldKey,
                            dateProvider: dateProvider);
                      }),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  const DateWidget({
    Key key,
    @required this.date,
    @required this.scaffoldKey,
    @required this.dateProvider,
  }) : super(key: key);

  final Date date;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final DateProvider dateProvider;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(date.id.toString()),
      onDismissed: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          await dateService.deleteDate(date.id).then((deleted) {
            if (deleted) {
              helpers.alert(scaffoldKey, "Date deleted successfully.");
              dateProvider.getDates();
            }
          });
        }
      },
      background: Container(
        color: Colors.red.shade400,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          'Delete',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat Bold',
            fontSize: 12.0,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        width: double.infinity,
        margin: EdgeInsets.only(
          bottom: 5.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              date.label ?? 'Date label',
              style: TextStyle(
                fontFamily: 'Montserrat Semibold',
                fontSize: 13.0,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.calendar_today,
                  color: Color(0xFFFE0000),
                  size: 12.0,
                ),
                SizedBox(width: 5.0),
                Text(
                  "${date.getDate()}" ?? '2021/01/01',
                  style: TextStyle(
                    color: Color(0xFFFE0000),
                    fontFamily: 'Montserrat Medium',
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
