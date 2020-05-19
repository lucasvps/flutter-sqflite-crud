import 'package:crud_sqflite/app/db/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  DatabaseHelper _db = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _db.fetchAllBooks().then((list) {
      controller.booksList = list;
    });
    //print(controller.booksList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Modular.to.pushNamed('/add-book');
          },
        ),
        appBar: AppBar(
          title: Text('Your books'),
          centerTitle: true,
        ),
        body: Observer(
          builder: (_) {
            return ListView.builder(
              itemCount: controller.booksList.length,
              itemBuilder: (context, index) {
                var books = controller.booksList;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Edit',
                          color: Colors.orange,
                          icon: Icons.edit,
                          onTap: () => null,
                        ),
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            _db.removeBook(books[index]);
                            _db.fetchAllBooks().then((list) {
                              controller.booksList = list;
                            });
                          },
                        ),
                      ],
                      child: ListTile(
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SleekCircularSlider(
                                appearance: CircularSliderAppearance(
                                  //size: 300,
                                  customColors: CustomSliderColors(
                                      shadowColor: Colors.black,
                                      progressBarColor: Colors.green),
                                  infoProperties: InfoProperties(
                                      mainLabelStyle: TextStyle(fontSize: 18)),
                                  customWidths:
                                      CustomSliderWidths(progressBarWidth: 5),
                                  //size: 80
                                ),
                                initialValue:
                                    ((double.parse(books[index].pagesRead) /
                                            double.parse(books[index].pages) *
                                            100)
                                        .truncateToDouble()),
                                min: 0,
                                max: 100,
                              ),
                              IconButton(
                                icon: Icon(Icons.more_horiz),
                                onPressed: null,
                              )
                            ],
                          ),
                          onTap: () {
                            Modular.to.pushNamed('/add-book');
                          },
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text(books[index].name, style: TextStyle(fontSize: 21),)),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child:
                                      Text("Author: ${books[index].author}", style: TextStyle(fontSize: 18))),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Pages : ${books[index].pages}' ,style: TextStyle(fontSize: 18)),
                               Text('Pages Read : ${books[index].pagesRead}', style: TextStyle(fontSize: 18)),
                            ],
                          )),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
