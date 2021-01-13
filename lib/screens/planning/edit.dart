import 'package:flutter/material.dart';
import 'package:kronosme/core/models/planning.dart';
import 'package:kronosme/core/utils/helpers.dart';
import 'package:kronosme/providers/planning_provider.dart';
import 'package:kronosme/services/planning_service.dart';
import 'package:provider/provider.dart';

class EditPlanning extends StatefulWidget {
  @override
  _EditPlanningState createState() => _EditPlanningState();
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
TextEditingController title = TextEditingController();
bool editingTitle = false;
Map<int, bool> editing = {};
Map<int, TextEditingController> titles = {};
List<Map<String, dynamic>> categories = [];
PlanningProvider planningProvider;
Planning planning;

class _EditPlanningState extends State<EditPlanning> {
  @override
  void initState() {
    super.initState();
    planningProvider = Provider.of<PlanningProvider>(context, listen: false);
  }

  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    planning = ModalRoute.of(context).settings.arguments;

    if (!loaded) {
      title.text = planning.activity;
      categories = planning.categories.map((e) => {'title': e.title, 'items': e.items}).toList();
      loaded = true;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            loaded = false;
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFFFE0000),
            size: 20.0,
          ),
        ),
        title: Text(
          'Edit Planning/Event',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Montserrat Bold',
            fontSize: 13.0,
          ),
        ),
        titleSpacing: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                editingTitle
                    ? TextFormField(
                        controller: title,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 13.0),
                        decoration: InputDecoration(
                          labelText: 'Planning Title',
                          labelStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.8),
                            fontSize: 12.0,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Colors.grey.withOpacity(0.4),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Colors.grey.withOpacity(0.4),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Color(0xFFFE0000),
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.check,
                              color: Colors.lightGreen,
                            ),
                            onPressed: () {
                              setState(() => editingTitle = !editingTitle);
                            },
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            title.text.isNotEmpty ? title.text : 'Planning Title',
                            style: TextStyle(
                              fontFamily: 'Montserrat Bold',
                              fontSize: 15.0,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 20.0,
                              color: Color(0xFFFE0000),
                            ),
                            onPressed: () {
                              setState(() => editingTitle = !editingTitle);
                            },
                          ),
                        ],
                      ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontFamily: 'Montserrat Bold',
                        fontSize: 15.0,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Color(0xFFFE0000),
                      ),
                      onPressed: () {
                        setState(() => categories.add({'title': "", 'items': []}));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Container(
                  height: MediaQuery.of(context).size.height - 250.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  padding: EdgeInsets.all(7.0),
                  child: ListView.builder(
                    // physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      if (editing[index] != null)
                        editing[index] = editing[index];
                      else
                        editing[index] = false;

                      if (categories[index] != null) {
                        categories[index] = categories[index];
                        titles[index] = TextEditingController(text: categories[index]['title']);
                      } else {
                        categories[index] = {'title': "", 'items': []};
                        titles[index] = TextEditingController();
                      }

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 1.0,
                              blurRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        padding: editing[index] ? EdgeInsets.fromLTRB(13.0, 10.0, 13.0, 10.0) : EdgeInsets.fromLTRB(13.0, 0.0, 0.0, 10.0),
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            if (editing[index])
                              TextFormField(
                                controller: titles[index],
                                onChanged: (String value) {
                                  categories[index]['title'] = value;
                                },
                                keyboardType: TextInputType.text,
                                style: TextStyle(fontSize: 13.0),
                                decoration: InputDecoration(
                                  labelText: 'Category Title',
                                  labelStyle: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 12.0,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Colors.grey.withOpacity(0.4),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Colors.grey.withOpacity(0.4),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.0,
                                      color: Color(0xFFFE0000),
                                    ),
                                  ),
                                ),
                              )
                            else
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    titles[index].text.isNotEmpty ? titles[index].text : "Category title",
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      fontFamily: 'Montserrat Bold',
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          setState(() {
                                            editing[index] = !editing[index];
                                          });
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          size: 14.0,
                                        ),
                                      ),
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          setState(() {
                                            categories.removeAt(index);
                                          });
                                        },
                                        icon: Icon(
                                          Icons.delete_forever,
                                          size: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            SizedBox(height: 1.0),
                            if (editing[index] == false)
                              Text(
                                "${categories[index]['items'].length ?? 0} Items (Tap to edit)",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontFamily: 'Montserrat Semibold',
                                  color: Color(0xFFFE0000),
                                ),
                              )
                            else
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: categories[index]['items'].length,
                                itemBuilder: (context, i) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: 5.0),
                                    child: TextFormField(
                                      controller: TextEditingController(text: categories[index]['items'][i] ?? ""),
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 13.0),
                                      onChanged: (String value) {
                                        categories[index]['items'][i] = value;
                                      },
                                      decoration: InputDecoration(
                                        labelText: "Item $i",
                                        labelStyle: TextStyle(
                                          color: Colors.grey.withOpacity(0.8),
                                          fontSize: 12.0,
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1.0,
                                            color: Colors.grey.withOpacity(0.4),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1.0,
                                            color: Colors.grey.withOpacity(0.4),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1.0,
                                            color: Color(0xFFFE0000),
                                          ),
                                        ),
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.close, size: 12.0),
                                            onPressed: () {
                                              setState(() {
                                                (categories[index]['items'] as List).removeAt(i);
                                              });
                                            }),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            if (editing[index])
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  RaisedButton(
                                    onPressed: () {
                                      setState(() {
                                        (categories[index]['items'] as List).add("");
                                      });
                                    },
                                    color: Colors.white,
                                    child: Text(
                                      'Add Item',
                                      style: TextStyle(
                                        color: Color(0xFFFE0000),
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                  RaisedButton(
                                    onPressed: () {
                                      setState(() {
                                        editing[index] = !editing[index];
                                      });
                                    },
                                    color: Color(0xFFFE0000),
                                    child: Text(
                                      'Save',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () async {
                          if (title.text.isEmpty) {
                            helpers.alert(scaffoldKey, "Planning title is empty");
                            return;
                          }

                          if (categories.length > 0 && categories[0]['items'].length > 0) {
                            Map<String, dynamic> data = {
                              'activity': title.text,
                              'categories': categories,
                            };

                            await planningService.updatePlanning(planning.id, data).then((value) {
                              if (value) {
                                helpers.alert(scaffoldKey, "Planning updated successfully.");
                                planningProvider.getPlannings();
                              } else {
                                helpers.alert(scaffoldKey, "Error occurred, unable to update planning.");
                              }
                            });
                          } else {
                            helpers.alert(scaffoldKey, "Add categories and items to categories.");
                          }
                        },
                        color: Color(0xFFFE0000),
                        child: Text(
                          'Update Planning',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
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
