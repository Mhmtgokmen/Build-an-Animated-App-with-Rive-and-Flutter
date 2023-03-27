import 'package:event/event.dart';

class SideBarChangeEvent {
  static Event<IndexEventArg>? _event;

  static Event<IndexEventArg> getInstance() {
    _event ??= Event<IndexEventArg>();
    return _event!;
  }
}

class IndexEventArg extends EventArgs {
  int index;
  String status;
  // bool isSideBarOpen;
  IndexEventArg(
    this.index,
    this.status
  );
}
