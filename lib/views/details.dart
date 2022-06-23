import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Details extends StatelessWidget {
  List data;
  Details(this.data);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backwardsCompatibility: true,
            centerTitle: false,
            pinned: true,
            floating: false,
            snap: false,
            backgroundColor: Colors.red[500],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(data.elementAt(0)),
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(data.elementAt(1)))),
              ),
            ),
            expandedHeight: height * 0.2,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.02),
              child: Container(
                color: Colors.white,
                  child: Text(
                  
                data.elementAt(2),
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20,),
              )),
            ),
          )
        ],
      )),
    );
  }
}
