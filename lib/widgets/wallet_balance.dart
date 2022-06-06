import 'package:astrotak/constants/constants.dart';
import 'package:flutter/material.dart';

class Walletbalance extends StatelessWidget {
  const Walletbalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.white),
        color: Color.fromARGB(255, 192, 218, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.wallet,
            color: kBlueColor,
          ),
          const Text(
            'Wallet Balance : 0',
            style: TextStyle(
              color: kBlueColor,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 0,
                side: const BorderSide(color: Colors.black),
                primary: Colors.white,
                minimumSize: const Size(20, 25)),
            child: const Text(
              'Add Money',
              style: TextStyle(color: kBlueColor, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
