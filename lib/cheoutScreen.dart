
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart01.dart';
import 'cart02.dart';
import 'cart03.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int cartPrice01 = 0;
  int cartPrice02 = 0;
  int cartPrice03 = 0;
  int ItemCount01 =0;
  int ItemCount02 =0;
  int ItemCount03 =0;



  @override
  void initState() {
    calculateTotalAmount();
    CalculateTotalItemCount();
    super.initState();
  }

  int calculateTotalAmount() {
    int totalAmount = cartPrice01 + cartPrice02 + cartPrice03;
    return totalAmount;
  }

  int CalculateTotalItemCount(){
    int totalItemCount = ItemCount01+ ItemCount02+ItemCount01;
    return totalItemCount;
}

  void _showCongratsSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Congratulations! Checkout successful.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      int totalItemCount = CalculateTotalItemCount();
      if (totalItemCount == 5) {
        _showDialog();
      }
    });

    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Bag',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              CartScreen01(
                updateItemCount: (itemCount) {
                  setState(() {
                    cartPrice01 = 52 * itemCount;
                    ItemCount01 = itemCount;
                  });
                },
                cartPrice01: cartPrice01,
              ),
              CartScreen02(
                updateItemCount: (itemCount) {
                  setState(() {
                    cartPrice02 = 37 * itemCount;
                    ItemCount02 = itemCount;
                  });
                },
                cartPrice02: cartPrice02,
              ),
              CartScreen03(
                updateItemCount: (itemCount) {
                  setState(() {
                    cartPrice03 = 42 * itemCount;
                    ItemCount03 = itemCount;
                  });
                },
                cartPrice03: cartPrice03,
              ),
              const SizedBox(
                height: 250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Amount:'),
                  Text(
                    '${calculateTotalAmount()}\$',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      _showCongratsSnackbar();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 48,
                      width: 343,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text(
                        'CHECK OUT',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulation!'),
          content: Text('You Have Added 5 T-shirt on your bag!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Center(
                child: Container(
                    height: 46,
                    width: 239,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Text('OK')),
              ),
            ),
          ],
        );
      },
    );
  }
}



