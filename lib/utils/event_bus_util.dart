import 'package:newslash/utils/event_bus.dart';

class EventBusUtil {
  static EventBus mEventBus;

  static EventBus init() {
    if (mEventBus == null) {
      mEventBus = EventBus();
    }
    return mEventBus;
  }
}
