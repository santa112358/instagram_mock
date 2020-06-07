import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemBuilder: (context, i) {
                return Container(
                  height: 30,
                  width: 40,
                  color: Colors.red,
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
