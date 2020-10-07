import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kronosme/models/todo.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Todo> _elements = [
    Todo(id: 1, title: 'Besoin de moi', done: false, group: 'MINDSET'),
    Todo(id: 2, title: 'Toi non plus', done: false, group: 'CHARACTER'),
    Todo(id: 3, title: 'Moins on y arrive', done: false, group: 'MINDSET'),
    Todo(id: 4, title: 'Et plus on se foire', done: false, group: 'HEALTH'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            margin: EdgeInsets.only(bottom: 10.0),
            child: Text(
              'To Do List',
              style: TextStyle(
                fontFamily: 'Montserrat Bold',
                fontSize: 15.0,
              ),
            ),
          ),
          Expanded(
            child: GroupedListView(
              elements: _elements,
              groupBy: (Todo todo) => todo.group,
              groupSeparatorBuilder: (value) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1.0,
                        blurRadius: 5.0,
                        offset: Offset(0, 1.0),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  ),
                  child: Text(
                    "$value (${_elements.where((element) => element.group == value).length})",
                    style: TextStyle(
                      fontFamily: 'Montserrat Bold',
                    ),
                  ),
                );
              },
              itemBuilder: (context, Todo todo) {
                return Dismissible(
                  key: Key(todo.id.toString()),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      setState(() {
                        _elements
                            .removeWhere((element) => element.id == todo.id);
                      });
                    }
                  },
                  background: Container(
                    color: Colors.red.shade400,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Do it later',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat Bold',
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.green.shade400,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat Bold',
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        border: Border(
                          bottom: BorderSide(color: Colors.white),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              todo.title,
                              style: TextStyle(
                                fontFamily: 'Montserrat Bold',
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.red.shade300,
                                  size: 18.0,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              GestureDetector(
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.red.shade300,
                                  size: 18.0,
                                ),
                              ),
                              SizedBox(width: 5.0),
                              GestureDetector(
                                child: Icon(
                                  Icons.close,
                                  color: Colors.red.shade300,
                                  size: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
