import 'package:crud_sqflite/app/app_controller.dart';
import 'package:crud_sqflite/app/components/widgets.dart';
import 'package:crud_sqflite/app/db/db_helper.dart';
import 'package:crud_sqflite/app/entities/book_entity.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  var appController = Modular.get<AppController>();
  
  @override
  void initState() {
    super.initState();
    
    appController.db.bookRepositoryDAO.getAllBooks().then((list) {
      controller.bookListEntity = list;
    });
    //print(controller.booksList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () {
            Modular.to.pushNamed('/add-book');
          },
        ),
        appBar: AppBar(
          actions: <Widget>[
            Observer(
              builder: (_) {
                return Switch(
                    activeColor: Colors.white,
                    value: Modular.get<AppController>().darkStatus,
                    onChanged: (_) {
                      Modular.get<AppController>().changeDarkStatus();
                    });
              },
            )
          ],
          title: Text('Your books'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('lib/app/assets/images/wpp.jpg'))),
          //color: Colors.blue,
          child: Observer(
            builder: (_) {
              return FutureBuilder(
                future:
                    appController.db.bookRepositoryDAO.getAllBooks(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return listView(snapshot.data);
                  }
                },
              );
            },
          ),
        ));
  }

  Widget listView(List<BookEntity> listOfBooks) {
    return ListView.builder(
      itemCount: listOfBooks.length,
      itemBuilder: (context, index) {
        if (controller.bookListEntity.isEmpty) {
          print('empty');
        } else if (controller.bookListEntity == null) {
          print('ta nula');
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Theme.of(context).cardTheme.color,
            //color: Colors.white70,
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Edit',
                  color: Colors.orange,
                  icon: Icons.edit,
                  onTap: () {
                    Modular.to.pushNamedAndRemoveUntil(
                        '/edit-book/${listOfBooks[index].id}/${listOfBooks[index].name}/${listOfBooks[index].author}/${listOfBooks[index].pages}/${listOfBooks[index].pagesRead}',
                        ModalRoute.withName('/'));
                  },
                ),
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {
                    //CustomWidget.showSnackBar('Book successfully deleted', Colors.red, _scaffoldkey);
                    CustomWidget.alert(
                        context,
                        'ATTENTION',
                        'Do you really wanna delete this book?',
                        _scaffoldkey,
                        listOfBooks[index]);
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
                          customWidths: CustomSliderWidths(progressBarWidth: 5),
                          //size: 80
                        ),
                        initialValue:
                            ((double.parse(listOfBooks[index].pagesRead) /
                                    double.parse(listOfBooks[index].pages) *
                                    100)
                                .truncateToDouble()),
                        min: 0,
                        max: 100,
                      ),
                      IconButton(
                        color: Theme.of(context).iconTheme.color,
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {},
                      )
                    ],
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            listOfBooks[index].name,
                            style: TextStyle(fontSize: 21),
                          )),
                      Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text("Author: ${listOfBooks[index].author}",
                              style: TextStyle(fontSize: 18))),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Pages : ${listOfBooks[index].pages}',
                          style: TextStyle(fontSize: 18)),
                      Text('Pages Read : ${listOfBooks[index].pagesRead}',
                          style: TextStyle(fontSize: 18)),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
