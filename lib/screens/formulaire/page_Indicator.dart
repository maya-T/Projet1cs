import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;

  PageIndicator(this.currentIndex, this.pageCount);

  _indicator(bool isActive) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
            height: 10.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white,width: .5),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: isActive ? Colors.white : Colors.transparent,
                )),
      ),
    );
  }

  _buildPageIndicator() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < pageCount; i++) {
      indicatorList
          .add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: _buildPageIndicator(),
    );
  }
}
