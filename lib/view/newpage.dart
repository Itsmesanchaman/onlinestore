import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onlinestore/provider/product_provider.dart';

class AllProducts extends ConsumerWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final state = ref.watch(productsProvider);
    return Scaffold(
      body: state.when(
          data: (data){


            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                mainAxisExtent: 320
                ),
                itemCount: data.length,
                itemBuilder: (context, index){
                  final productList = data[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                                height: 120,
                                child: Image.network(productList.image)),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(productList.title,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Price: \$ ${productList.price ?? 'N/A'}"),
                          )
                        ],
                      ),
                    ),
                  );

                });
          },
          error: (err, st){
            return Text('$err');
          },
          loading: (){
            return CircularProgressIndicator();
          }),
    );
  }
}
