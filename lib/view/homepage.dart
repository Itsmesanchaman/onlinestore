import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onlinestore/view/all_category.dart';
import 'package:onlinestore/view/newpage.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text('Online Store',style: TextStyle(fontWeight: FontWeight.bold),),centerTitle: true,
        backgroundColor: Colors.blueGrey,
        bottom: const TabBar(
          tabs: [
            Tab(
              child: Text('All Products', style: TextStyle(color: Colors.black,fontSize: 17),),

            ),
            Tab(
              child: Text('All Category',style: TextStyle(color: Colors.black,fontSize: 17),),)

          ],
        ),
        ),
        body: const TabBarView(children: [
          AllProducts(),
          AllCategory()
        ],),


      ),
    );
  }
}
