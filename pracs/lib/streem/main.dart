import 'dart:async';

main() {
  runZoned(() async {
    exampleOutOfZone();
  }, onError: (e, stacktrace) {
    print('caught: $e');
  }, zoneSpecification: ZoneSpecification(print: (
      Zone self,
      ZoneDelegate parent,
      Zone zone,
      String message,
      ) {
    parent.print(zone, '${DateTime.now()}: $message');
  }));
}

Future example() async {
  await for (var x in streamer()) {
    print('Got $x');
    if (x == 9) throw ('error: $x');
  }
}

Future exampleOutOfZone() async {
  await for (var x in streamer()) {
    print('${DateTime.now()}:Got $x');
    if (x == 9) throw ('error: $x');
  }
}

Stream<int> streamer() async* {
  var duration = const Duration(milliseconds: 1000);
  for (var x = 0; x < 100; x++) {
    await Future.delayed(duration);
    yield x;
  }
}



    // void main(List<String> args) async{
    //   print('Top of Main function');
    //   Future.delayed(
    //     const Duration(milliseconds:500),
    //         () => print('Future'),);
    //   scheduleMicrotask(
    //         () => print("Hello from Microtask Queue"),
    //   );
    //   Future(() => print('From Future two'),);
    //   scheduleMicrotask(
    //         () => print("Hello from Microtask Queue #2"),
    //   );
    //   print('Bottom of Main Function');
    // }



// void _fakeMain(List<String> args) {
//   int counter = 10;
//
//   _func() {
//     print(counter);
//     counter--;
//     if (counter != 0) {
//       Future.delayed(const Duration(seconds: 2), _func);
//     }
//   }
//
//   _func();
// }
//
// main(List<String> args) async {
//   EventLoop.callFunc(_fakeMain, []);
// }
//
// class EventLoop {
//   static final List<Function> queue = [];
//   static final List<Function> microtask = [];
//
//   static void run(Function function) {
//     print("queuing function");
//     queue.add(function);
//   }
//
//   static void runMicrotask(Function function) {
//     print("add microtask");
//     microtask.add(function);
//   }
//
//   static void eventLoop() {
//     while (microtask.isNotEmpty) {
//       microtask.removeAt(0)();
//     }
//     while (queue.isNotEmpty) {
//       while (microtask.isNotEmpty) {
//         microtask.removeAt(0)();
//       }
//       queue.removeAt(0)();
//     }
//
//     if (microtask.isNotEmpty || queue.isNotEmpty) {
//       eventLoop();
//     }
//   }
//
//   static callFunc(Function func, List<String> args) {
//     var zone = Zone.current.fork(
//       specification: ZoneSpecification(scheduleMicrotask: (
//         zoneOne,
//         delegate,
//         zoneTwo,
//         func,
//       ) {
//         EventLoop.runMicrotask(func);
//       }, createTimer: (
//         zoneOne,
//         delegate,
//         zoneTwo,
//         duration,
//         func,
//       ) {
//         if (duration == Duration.zero) {
//           EventLoop.run(func);
//           return delegate.createTimer(zoneTwo, duration, () => func());
//         } else {
//           return delegate.createTimer(zoneTwo, duration, () => func());
//         }
//       }),
//     );
//
//     zone.runUnary(_fakeMain, args);
//     eventLoop();
//   }
// }
