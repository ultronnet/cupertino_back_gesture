import 'package:flutter/gestures.dart';

class BackHorizontalDragGestureRecognizer extends HorizontalDragGestureRecognizer {
  BackHorizontalDragGestureRecognizer({Object debugOwner, PointerDeviceKind kind})
      : super(debugOwner: debugOwner, kind: kind);

  Offset _dragDistance = Offset.zero;

  @override
  void addPointer(PointerEvent event) {
    super.addPointer(event);
  }

  @override
  void handleEvent(PointerEvent event) {
    _dragDistance = _dragDistance + event.delta;
    if (event is PointerMoveEvent) {
      final double dx = _dragDistance.dx;
      if (dx < 0) {
        resolve(GestureDisposition.rejected);
      } else {
        resolve(GestureDisposition.accepted);
      }
      _dragDistance = Offset.zero;
    }
    super.handleEvent(event);
  }

  @override
  String get debugDescription => 'back horizontal drag';

  @override
  void didStopTrackingLastPointer(int pointer) {}
}
