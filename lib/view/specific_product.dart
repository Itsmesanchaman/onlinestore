import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onlinestore/provider/allcate.dart';

class SpecificProduct extends ConsumerWidget {
  final String specific;
  const SpecificProduct({
    super.key, required this.specific
});

  @override
  Widget build(BuildContext context, ref) {

    final state = ref.watch(cateProvider(specific));

    return Scaffold(
      body: state.when(
          data: (data){
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                mainAxisExtent: 290
                ),
                itemCount: data.length,
                itemBuilder: (context, index){
                  final category = data[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                                height: 100,
                                width: 100,
                                child: Image.network(category.image)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(category.title),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('\$ ${category.price.toString()}'),
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
