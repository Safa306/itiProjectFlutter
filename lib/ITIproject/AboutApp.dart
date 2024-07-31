import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Aboutapp extends StatelessWidget {
  const Aboutapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About App",style: TextStyle(
            fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.brown
        ),
        ),
        centerTitle: true,
      ),
      body: const Center(

         child: Padding(
           padding: EdgeInsets.all(20.0),
           child: Column(

             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Text("Discover a world of endless possibilities with our shopping app. From the latest beauty trends to unique finds, we have something for everyone. Explore our curated categories, including fragrances , furniture and groceries. Enjoy a seamless shopping experience with secure payments and hassle-free returns. "
                 ,style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20,

               ),
               ),
               SizedBox(height: 20,),
               Text("The app has 3 pages: Home , Profile and Categories and also contains a drawer has list of another options "
                 ,style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20,

                 ),
               )
             ],
           ),
         ),
      ),
    );
  }
}
