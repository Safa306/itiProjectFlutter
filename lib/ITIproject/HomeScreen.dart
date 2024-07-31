//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ITIproject/ProfilePage.dart';

import '../dio/api_provider.dart';
import '../models/products_model.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {


  ApiProvider? apiProvider;
  ProductModel? productModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  Future getProducts() async {
    productModel = await ApiProvider().getProducts();
    setState(() {
      isLoading = false;
    });
    print(productModel?.products![0].title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Market"),

      ),
      body: productModel == null ? const Center(
        child: CircularProgressIndicator(),
      )
          : GridView.builder(
          itemCount: productModel!.products?.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(5),
              child: Column(
                children: [
                  Image.network(productModel!.products![index].thumbnail ?? "",
                    height: 140,
                    width: 200,
                  ),
                  Text(
                    productModel!.products![index].title ?? "",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("EGP"),
                      Text(productModel!.products![index].price.toString() ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}

