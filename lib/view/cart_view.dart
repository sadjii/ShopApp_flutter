import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shop_app_mixin/constance.dart';
import 'package:shop_app_mixin/core/viewmodel/cart_view_model.dart';
// import 'package:shop_app_mixin/view/checkout_view.dart';
import 'package:shop_app_mixin/view/widgets/validation_button.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.put(CartViewModel()),
      builder: (controller) => Scaffold(
        body: controller.cartProductModel.length == 0
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/empty.svg',
                      height: 250,
                      width: 250,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Empty cart',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Kprimarycolor,
                      ),
                    )
                  ],
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03,
                        top: MediaQuery.of(context).size.width * 0.03,
                      ),
                      color: Color(0x4DC4C4C4),
                      child: ListView.separated(
                        itemCount: controller.cartProductModel.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      28,
                                    ),
                                  ),
                                  width: 120,
                                  height: 120,
                                  child: Image.network(
                                    controller.cartProductModel[index].image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 200),
                                        child: Text(
                                          controller
                                              .cartProductModel[index].name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Ksecondarycolor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        controller.cartProductModel[index].price
                                                .toString() +
                                            ' DZD',
                                        style: TextStyle(
                                          color: Kprimarycolor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 100,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controller
                                                    .increaseQuantity(index);
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Ksecondarycolor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              controller.cartProductModel[index]
                                                  .quantity
                                                  .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                controller
                                                    .decreaseQuantity(index);
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: Ksecondarycolor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 5,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total:',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                              GetBuilder<CartViewModel>(
                                // init: Get.find(),
                                init: Get.put(CartViewModel()),
                                builder: (controller) => Text(
                                  '${controller.totalPrice} DZD',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Kprimarycolor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ValidationButton(
                            text: 'Check out',
                            onPress: () {
                              // Get.to(() => CheckOutView());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}