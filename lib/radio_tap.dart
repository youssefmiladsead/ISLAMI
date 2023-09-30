import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/radio_image.png'),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Radio Elquran Elkarem',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_previous,
              color: Color(0xffB7935F),
              size: 28,
            ),
            SizedBox(width: 20),
            Icon(
              Icons.play_arrow_rounded,
              color: Color(0xffB7935F),
              size: 28,
            ),
            SizedBox(width: 20),
            Icon(
              Icons.skip_next,
              color: Color(0xffB7935F),
              size: 28,
            ),
          ],
        ),
      ],
    );
  }
}
