// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_api_calling/ui_helper/util.dart';
//
// class ProductDetailPage extends StatefulWidget {
//   List<String>? productModel;
//
//   ProductDetailPage({super.key, required this.productModel});
//
//   @override
//   State<ProductDetailPage> createState() => _ProductDetailPageState();
// }
//
// class _ProductDetailPageState extends State<ProductDetailPage> {
//   int currentIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     print(widget.productModel!.elementAt(0));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: mAppBar(context, "Product Detail Page"),
//       body: Column(
//         children: [
//           // Add Carousel Slider Here
//           CarouselSlider(
//             options: CarouselOptions(
//               height: 200.0,
//               enlargeCenterPage: true,
//               onPageChanged: (int index, CarouselPageChangedReason reason) {
//                 setState(() {
//                   currentIndex = index;
//                 });
//               },
//               autoPlay: true,
//               aspectRatio: 16 / 9,
//               autoPlayCurve: Curves.fastOutSlowIn,
//               enableInfiniteScroll: true,
//               autoPlayAnimationDuration: Duration(milliseconds: 800),
//               viewportFraction: 0.8,
//             ),
//             items: widget.productModel!.map((item) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 150,
//                     margin: EdgeInsets.only(top: 16),
//                     decoration: BoxDecoration(
//                       color: AppColor.pink_color,
//                       borderRadius: BorderRadius.circular(10.0),
//                       boxShadow: [
//                         BoxShadow(color: AppColor.pink_color, blurRadius: 5.0)
//                       ],
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10.0),
//                       child: Image(
//                         fit: BoxFit.cover,
//                         image: NetworkImage(item),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }).toList(),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               for (int i = 0; i < widget.productModel!.length; i++)
//                 Container(
//                     height: 6,
//                     width: 6,
//                     margin: EdgeInsets.all(3),
//                     decoration: BoxDecoration(
//                       color: currentIndex == i
//                           ? AppColor.pink_color
//                           : Color(0xFFD2D2D2),
//                       shape: BoxShape.circle,
//                     ))
//             ],
//           ),
//           // Expanded(
//           //   child: ListView.builder(
//           //     itemCount: widget.productModel!.length,
//           //     itemBuilder: (context, index) {
//           //       // Your existing list item code goes here
//           //       // Example: return ListTile(title: Text(widget.productModel![index]));
//           //     },
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
//
// // Replace YourImageWidget with the widget you want to use to display images in the carousel.
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_calling/ui_helper/util.dart';

class ProductDetailPage extends StatefulWidget {
  List<String>? productModel;

  ProductDetailPage({Key? key, required this.productModel}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    print(widget.productModel!.elementAt(0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mAppBar(context, "Product Detail Page"),
      body: Column(
        children: [
          if (widget.productModel!.length > 1)
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: widget.productModel!.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      margin: EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                        color: AppColor.pink_color,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(color: AppColor.pink_color, blurRadius: 5.0)
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(item),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            )
          else
            Container(
              height: 200.0,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(widget.productModel![0]),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.productModel!.length; i++)
                Container(
                  height: 6,
                  width: 6,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: currentIndex == i
                        ? AppColor.pink_color
                        : Color(0xFFD2D2D2),
                    shape: BoxShape.circle,
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
