// import 'package:flutter/material.dart';
// import 'package:flutter_api_calling/productui/product_controller/product_controller.dart';
// import 'package:flutter_api_calling/ui_helper/util.dart';
// import 'package:get/get.dart';
//
// class ProductPage extends StatefulWidget {
//   const ProductPage({super.key});
//
//   @override
//   State<ProductPage> createState() => _ProductPageState();
// }
//
// class _ProductPageState extends State<ProductPage> {
//   ProductController productController = Get.put(ProductController());
//
//   initState() {
//     super.initState();
//     productController.fetchProductData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: mAppBar(context, "Product Page"),
//       body: Padding(
//         padding: const EdgeInsets.all(6.0),
//         child: Obx(
//           () => productController.isLoading.value
//               ? Center(child: CircularProgressIndicator())
//               : ListView.builder(
//                   itemCount:
//                       productController.productModel?.products?.length ?? 0,
//                   itemBuilder: (context, index) {
//                     return Text(
//                       'Name: ${productController.productModel?.products?[index].id}',
//                       style: mTextStyle20().copyWith(color: Colors.black),
//                     );
//                   },
//                 ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_api_calling/productui/product_details_page.dart';
import 'package:flutter_api_calling/productui/product_controller/product_controller.dart';
import 'package:flutter_api_calling/ui_helper/util.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    productController.fetchProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mAppBar(context, "Product Page"),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Obx(
          () => productController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 193,
                  ),
                  itemCount:
                      productController.productModel?.products?.length ?? 0,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) {
                              return ProductDetailPage(productModel: productController.productModel!.products![index].images);
                        }));
                      },
                      child: Container(
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColor.pink_color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 140,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        "${productController.productModel?.products?[index].thumbnail}",
                                      ).image),
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Expanded(
                                child: Text(
                                  '${productController.productModel?.products?[index].title}',
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: mTextStyle16(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
