import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:clipstream/intro_views_flutter/Models/page_bubble_view_model.dart';

/// This class contains the UI for page bubble.
class PageBubble extends StatelessWidget {
  //view model
  final PageBubbleViewModel viewModel;

  //Constructor
  PageBubble({
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 33.0,
      height: 42.0,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 20.0, //This method return in between values according to active percent.
            height: 20.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: viewModel.activePercent == 1 && viewModel.activePercent > 0 ? Colors.white : Colors.black,
              //Alpha is used to create fade effect for background color
              // color: viewModel.isHollow
              //     ? viewModel.bubbleBackgroundColor
              //         .withAlpha((0x88 * viewModel.activePercent).round())
              //     : viewModel.bubbleBackgroundColor,
              border: Border.all(
                // color: viewModel.isHollow
                //     ? viewModel.bubbleBackgroundColor.withAlpha(
                //         (0x88 * (1 - viewModel.activePercent)).round())
                //     : Colors.white,
                width: 0.0,
              ),
            ),
            child: Container(),
          ), //Container
        ), //Padding
      ), //Center
    ); //Container
  }
}
