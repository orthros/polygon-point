#!/bin/bash

# Fast fail the script on failures.
set -e

# Analyze the code.
dartanalyzer --strong --fatal-warnings \
  lib/polygon_point.dart 

# Run the tests.
dart -c test/line_segment_test.dart
dart -c test/line_test.dart