import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        //height: 30,
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4.0,
                  width: 20.0,
                  margin: const EdgeInsets.only(bottom: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                const Icon(Icons.home, size: 36.0, color: Colors.white),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4.0,
                  width: 20.0,
                  margin: const EdgeInsets.only(bottom: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                const Icon(Icons.home, size: 36.0, color: Colors.white),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4.0,
                  width: 20.0,
                  margin: const EdgeInsets.only(bottom: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                const Icon(Icons.home, size: 36.0, color: Colors.white),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4.0,
                  width: 20.0,
                  margin: const EdgeInsets.only(bottom: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                const Icon(Icons.home, size: 36.0, color: Colors.black),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4.0,
                  width: 20.0,
                  margin: const EdgeInsets.only(bottom: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                const Icon(Icons.home, size: 36.0, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
