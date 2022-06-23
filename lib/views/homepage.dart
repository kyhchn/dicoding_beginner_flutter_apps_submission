import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_dicoding/database.dart';
import 'package:submission_dicoding/views/details.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: false,
              title: Text('Welcome to Indonesia'),
              floating: false,
              pinned: true,
              snap: false,
              backgroundColor: Colors.red[500],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/pesona_indonesia.png'))),
                ),
              ),
              expandedHeight: height * 0.2,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) =>
                                    Details(Database.data.elementAt(index)))),
                        child: Container(
                          height: height * 0.18,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            Database.data[index].elementAt(1)),
                                      )),
                                  width: width * 0.4,
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                Text(Database.data[index].elementAt(0))
                              ],
                            ),
                          ),
                        ),
                      ),
                  childCount: Database.data.length),
            ),
          ],
        ),
      ),
    );
  }
}
