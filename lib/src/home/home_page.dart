import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical_task/src/home/provider/home_provider.dart';
import 'package:flutter_practical_task/util/colors.dart';
import 'package:flutter_practical_task/util/images.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 100)).then(
      (value) {
        context.read<HomeProvider>().fetchProductData();
      },
    );
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.white,
          centerTitle: true,
          title: Text(
            'Lost & Found',
            style: TextStyle(color: AppColor.black),
          ),
          leading: Image.asset(AppImages.menu),
          actions: [
            IconButton(onPressed: () async {}, icon: Image.asset(AppImages.add))
          ],
          bottom: TabBar(
              indicatorColor: AppColor.blueColor,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: AppColor.black,
              padding: const EdgeInsets.all(8),
              indicator: ShapeDecoration(
                  color: AppColor.blueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: AppColor.blueColor))),
              tabs: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Lost'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Found'),
                ),
              ]),
        ),
        body: TabBarView(children: [
          listView(context),
          listView(context),
        ]),
      ),
    );
  }

  Widget listView(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return value.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColor.blueColor,
                ),
              )
            : ListView.builder(
                itemCount: value.productList.length,
                itemBuilder: (context, index) {
                  var product = value.productList[index];
                  return Card(
                      child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                color: Colors.white.withOpacity(0.2),
                                height: 100,
                                width: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.network(
                                    product.image ?? '',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    product.description ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: AppColor.grey, fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        product.category ?? '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Price: ' +
                                            (product.price ?? 0).toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: AppColor.blueColor),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ]),
                    ),
                  )

                      // ListTile(
                      //   isThreeLine: true,
                      //   leading: SizedBox(
                      //     height: 100,
                      //     width: 100,
                      //     child: Image.network(
                      //       product.image ?? '',
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      //   title: Text(product.title ?? ''),
                      //   subtitle: Text('test'),
                      // ),
                      );
                },
              );
      },
    );
  }
}
