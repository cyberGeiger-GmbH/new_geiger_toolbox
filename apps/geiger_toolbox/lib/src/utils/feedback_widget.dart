import 'package:feedback/feedback.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FeedbackWidget {
  // * Don't wrap with BetterFeedback if web HTML renderer is used

  static Widget wrapWidget({required Widget child}) {
    return !kIsWeb ? BetterFeedback(child: child) : child;
  }
}
