import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:onlinestore/provider/allcate.dart';
import 'package:onlinestore/view/specific_product.dart';

class AllCategory extends ConsumerWidget {
  const AllCategory({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final state = ref.watch(AllCateProvider);
    return Scaffold(
      body: state.when(
          data: (data){
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: data.length,
                itemBuilder: (context, index){
                  final allCatePro = data[index];

                  return InkWell(
                      onTap: (){
                        Get.to(SpecificProduct(specific: allCatePro,));
                      },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey,
                        child: Center(child: Text(allCatePro,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                  );

                });
          },
          error: (err, st){
            return Text('$err');
          },
          loading: (){
            return const CircularProgressIndicator();
          }),
    );
  }
}
