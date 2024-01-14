import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen02 extends StatefulWidget {
  final Function(int) updateItemCount;
  final cartPrice02;
  const CartScreen02({super.key, required this.updateItemCount, required this.cartPrice02});

  @override
  State<CartScreen02> createState() => _CartScreen02State();
}

class _CartScreen02State extends State<CartScreen02> {

  int itemCount = 0;

  void _increaseItemCount(){
    setState(() {
      itemCount++;
    });
    widget.updateItemCount(itemCount);
  }

  void _decreaseItemCount(){
    setState(() {
      itemCount = itemCount > 0? itemCount -1 : 0;
    });
    widget.updateItemCount(itemCount);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        height: 104,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///----------Product Image-------------------------------------------------------
                  Container(
                      height: 120,
                      width: 104,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
                          child: Image.asset('assets/images/tshirt02.jpg',fit: BoxFit.cover,))),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///---------Product Size/Color text-------------------------------------------------------------
                      Text('Pullover', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Row(
                        children: [
                          RichText(text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Color :',
                                    style: TextStyle( color: Colors.black)
                                ),
                                TextSpan(
                                    text: ' Black',
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
                                )
                              ]
                          )),
                          SizedBox(width: 10,),
                          RichText(text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Size :',
                                    style: TextStyle( color: Colors.black)
                                ),
                                TextSpan(
                                    text: ' L',
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
                                )
                              ]
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ///------------------More_vertical/ Price--------------------------------------------
                          GestureDetector(
                            onTap: (){
                              _decreaseItemCount();
                            },
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(32)
                              ),
                              child: Icon(Icons.remove),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text('$itemCount', style: TextStyle(fontSize: 18),),
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: (){
                              _increaseItemCount();
                            },
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(32)
                              ),
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.more_vert),
                  Text('${widget.cartPrice02}\$', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
