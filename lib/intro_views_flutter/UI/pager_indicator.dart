import 'package:flutter/material.dart';
import 'package:clipstream/intro_views_flutter/Constants/constants.dart';
import 'package:clipstream/intro_views_flutter/Models/page_bubble_view_model.dart';
import 'package:clipstream/intro_views_flutter/Models/pager_indicator_view_model.dart';
import 'package:clipstream/intro_views_flutter/UI/page_bubble.dart';

/// This class contains the UI elements associated with bottom page indicator.

class PagerIndicator extends StatelessWidget {
  //view model
  final PagerIndicatorViewModel viewModel;

  //Constructor
  PagerIndicator({
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    //Extracting page bubble information from page view model
    List<PageBubble> bubbles = [];

    for (var i = 0; i < viewModel.pages.length; i++) {
      final page = viewModel.pages[i];

      //calculating percent active
      var percentActive;
      if (i == viewModel.activeIndex) {
        percentActive = 1.0 - viewModel.slidePercent;
      } else if (i == viewModel.activeIndex - 1 &&
          viewModel.slideDirection == SlideDirection.leftToRight) {
        percentActive = viewModel.slidePercent;
      } else if (i == viewModel.activeIndex + 1 &&
          viewModel.slideDirection == SlideDirection.rightToLeft) {
        percentActive = viewModel.slidePercent;
      } else {
        percentActive = 0.0;
      }

      //Checking is that bubble hollow
      bool isHollow = i > viewModel.activeIndex ||
          (i == viewModel.activeIndex &&
              viewModel.slideDirection == SlideDirection.leftToRight);

      //Adding to the list
      bubbles.add(PageBubble(
        viewModel: PageBubbleViewModel(
          iconAssetPath: page.iconImageAssetPath,
          iconColor: page.iconColor,
          isHollow: isHollow,
          activePercent: percentActive,
          bubbleBackgroundColor: page.bubbleBackgroundColor,
          bubbleInner: page.bubble,
        ),
      ));
    }

    //UI
    return Column(
      children: <Widget>[
        Expanded(child: Container()),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: bubbles,
              ),
            ],
          ),
        ), //Transform
      ], //Children
    ); //Column
  }
}
