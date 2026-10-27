
import 'dart:async';
import 'package:flutter/material.dart';

// =====================================================
// STUDENT INFORMATION
// =====================================================

const String studentName = 'NABIHA NOOR';
const String rollNo = '04072312022';

// =====================================================
// SEEDED SETTINGS - DO NOT CHANGE
// =====================================================

final int seed = int.parse(rollNo.substring(rollNo.length - 2));
final int t = seed ~/ 10;
final int u = seed % 10;

const List<String> courses = [
  'Mobile Dev',
  'Data Structures',
  'Operating Systems',
  'Databases',
  'Networks',
  'Software Eng',
  'AI',
  'Web Engineering',
  'Graphics',
  'Security',
];

const List<String> names = [
  'Ali',
  'Sara',
  'Omar',
  'Hina',
  'Zain',
  'Maya',
];

const List<String> mains = [
  'start',
  'center',
  'end',
  'spaceBetween',
  'spaceAround',
  'spaceEvenly',
];

const List<String> crosses = [
  'start',
  'center',
  'end',
];

const List<String> hues = [
  'teal',
  'indigo',
  'orange',
  'pink',
  'green',
];

const Map<String, MaterialColor> swatches = {
  'teal': Colors.teal,
  'indigo': Colors.indigo,
  'orange': Colors.orange,
  'pink': Colors.pink,
  'green': Colors.green,
};

final String course = courses[u];

// =====================================================
// STEP 1 AND STEP 2 - CLOCK SETTINGS
// =====================================================

final int startSec = 5 * (1 + t % 5);
final int tick = 1 + u % 3;
final int ticks = 4 + u % 4;
final int stopAt = startSec + ticks * tick;

// =====================================================
// STEP 4 AND STEP 5 - TILE SETTINGS
// =====================================================

final String tileA = names[u % 6];
final String tileB = names[(u + 2) % 6];
final String tileC = names[(u + 4) % 6];
final int tapsToMake = 2 + t % 3;

// =====================================================
// STEP 6 - ROW AND COLUMN SETTINGS
// =====================================================

final String mainName = mains[u % 6];
final String crossName = crosses[t % 3];

// =====================================================
// STEP 8 - EXPANDED AND FLEXIBLE SETTINGS
// =====================================================

final double fixedW = 70.0 + 10 * u;
final int flexA = 1 + t % 3;
final int flexB = 1 + u % 2;

// =====================================================
// STEP 9 - CONTAINER SETTINGS
// =====================================================

final double boxMargin = 4.0 + 2 * (t % 5);
final double boxPad = 8.0 + 2 * (u % 5);
final double boxRadius = 4.0 * (1 + (t + u) % 4);
final double boxBorder = 1.0 + t % 3;
final String hue = hues[(t + u) % 5];

// =====================================================
// STEP 10 - STACK SETTINGS
// =====================================================

final double dotTop = 4.0 + 4 * (t % 4);
final double dotRight = 4.0 + 4 * (u % 4);
final double dotBottom = 4.0 + 4 * ((t + u) % 4);
final double dotLeft = 4.0 + 4 * ((t + 2 * u) % 4);

// =====================================================
// LIFECYCLE LOG
// =====================================================

final List<String> lifecycleLog = <String>[];

// =====================================================
// MAIN FUNCTION
// =====================================================

void main() => runApp(const LabApp());

// =====================================================
// MAIN APPLICATION
// =====================================================

class LabApp extends StatelessWidget {
  const LabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Team Board',
      home: HomePage(),
    );
  }
}

// =====================================================
// HOME PAGE
// =====================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Board: $course'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SettingsCard(),
            const SizedBox(height: 12),

            // STEP 4: Welcome widget
            const Welcome(),
            const SizedBox(height: 12),

            // STEPS 1, 2, 3: Clock and Probe
            const Clock(),
            const SizedBox(height: 12),

            // STEP 5: Swapping tiles
            const SwapBoard(),

           //STEP 6 - Row and Column
           const InfoPanel(),  
            // New widgets from Steps 6-10
            // will be added below.

            const SizedBox(height: 12),
            const SummaryRow(),

            const SizedBox(height: 12),
            const ShareRow(),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// SETTINGS CARD - PROVIDED BY INSTRUCTOR
// =====================================================

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'YOUR SETTINGS (seed $seed)\n'
      'clock: start $startSec, tick $tick, stop at $stopAt\n'
      'tiles: $tileA, $tileB, $tileC (taps for the Step 5 experiment: $tapsToMake)\n'
      'row main axis: $mainName | column cross axis: $crossName\n'
      'flex: $flexA and $flexB | fixed width: ${fixedW.toStringAsFixed(0)}\n'
      'box: margin $boxMargin, padding $boxPad, radius $boxRadius, '
      'border $boxBorder, colour $hue\n'
      'stamp: top $dotTop, right $dotRight, bottom $dotBottom, left $dotLeft',
      key: const Key('settings'),
      style: const TextStyle(
        fontFamily: 'monospace',
        fontSize: 12,
      ),
    );
  }
}

// =====================================================
// SUMMARY ROW - PROVIDED FOR STEP 7
// Do not modify until Step 7.
// =====================================================


 // =====================================================
 // STEP 7 - OVERFLOW AND EXPANDED
 // =====================================================

 // THINK QUESTION - STEP 7:
 // Why does Expanded make Text wrap?
 //
 // ANSWER:
 // Constraints go down, sizes go up.
 // Expanded gives each Text a limited share of Row width.
 // The Text wraps its words within those constraints.
 // This prevents horizontal overflow.

 class SummaryRow extends StatelessWidget {
   const SummaryRow({super.key});

   @override
   Widget build(BuildContext context) {
     return Row(
       children: [
         Expanded(
           child: Text(
             'Part A: read the widget tree of the $course board from top to bottom.',
             key: const Key('sum-a'),
           ),
         ),

         Expanded(
           child: Text(
             'Part B: build each box from small widgets and never extend a built-in class.',
             key: const Key('sum-b'),
           ),
         ),

         Expanded(
           child: Text(
             'Part C: break the layout on purpose, then fix it with Expanded or Wrap.',
             key: const Key('sum-c'),
           ),
         ),
       ],
     );
   }
 }


// =====================================================
// STEP 1 - CLOCK USING TIMER AND INITSTATE
// STEP 2 - DISPOSE AND BUILD COUNTER
// =====================================================

// THINK QUESTION - STEP 1:
// Why start the Timer in initState instead of build?
//
// ANSWER:
// initState runs once when the State is created.
// build can run many times during widget rebuilding.
// Starting a Timer inside build could create multiple
// timers and make the clock run faster.

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;

  int _seconds = startSec;
  int _builds = 0;

  @override
  void initState() {
    super.initState();

    lifecycleLog.add('initState');

    // Timer runs once every second.
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() => _seconds += tick);

        // Stop the clock at its required limit.
        if (_seconds >= stopAt) {
          timer.cancel();
        }
      },
    );
  }

  @override
  void dispose() {
    // Cancel the Timer to prevent it from running
    // after the State has been removed.
    _timer.cancel();

    lifecycleLog.add('dispose');

    super.dispose();
  }

  // THINK QUESTION - STEP 2:
  // Why does Builds increase by one per second?
  //
  // ANSWER:
  // Each timer tick calls setState once.
  // Normally this produces one Clock rebuild per tick.
  //
  // What happens if Timer is not cancelled in dispose?
  //
  // ANSWER:
  // The Timer may keep running after the State is removed.
  // Calling setState then can cause the error:
  // "setState() called after dispose()".

  @override
  Widget build(BuildContext context) {
    _builds++;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Session: $_seconds s',
          key: const Key('clock'),
        ),
        Text(
          'Builds: $_builds',
          key: const Key('builds'),
        ),

        // STEP 3: Probe gets updated clock seconds.
        Probe(seconds: _seconds),
      ],
    );
  }
}

// =====================================================
// STEP 3 - BUILDCONTEXT: WIDGET VS ELEMENT
// =====================================================

// THINK QUESTION - STEP 3:
// Which is cheap and replaced during rebuilds?
//
// ANSWER:
// Widget objects are lightweight descriptions.
// New Widget objects can be created on every rebuild.
//
// Elements usually remain in the tree when a widget
// is replaced by another widget of the same type
// and key. A StatefulElement also keeps its State.
//
// Where is the RenderObject and what does it do?
//
// ANSWER:
// RenderObjects are part of Flutter's render tree.
// They handle layout, sizing, positioning and painting.

class Probe extends StatelessWidget {
  final int seconds;

  const Probe({
    super.key,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    // Check whether Scaffold exists above this widget.
    final bool above =
        context.findAncestorWidgetOfExactType<Scaffold>() != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Seen at: $seconds s',
          key: const Key('probe-seen'),
        ),
        Text(
          'Widget #${identityHashCode(this)}',
          key: const Key('probe-widget'),
        ),
        Text(
          'Element #${identityHashCode(context)}',
          key: const Key('probe-element'),
        ),
        Text(
          'Context belongs to: ${context.widget.runtimeType}',
          key: const Key('probe-context'),
        ),
        Text(
          'Scaffold above me: $above',
          key: const Key('probe-above'),
        ),
      ],
    );
  }
}

// =====================================================
// STEP 4 - COMPOSITION AND WELCOME WIDGET
// =====================================================

// THINK QUESTION - STEP 4:
// What is composition and why does Flutter prefer it?
//
// ANSWER:
// Composition means combining smaller widgets
// to build a larger reusable widget.
// It is flexible and avoids unnecessary inheritance.

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome, $studentName',
        key: const Key('welcome'),
      ),
    );
  }
}

// =====================================================
// STEP 4 - CLICKABLE TILE
// =====================================================

// Tile is Stateful because its tap counter changes.
// ElevatedButton is used inside Tile through composition.

class Tile extends StatefulWidget {
  const Tile(this.label, {super.key});

  final String label;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  int taps = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Increase only this Tile's counter.
        setState(() => taps++);
      },
      child: Text('${widget.label}: $taps'),
    );
  }
}

// =====================================================
// STEP 5 - VALUEKEY AND SWAPPING TILES
// =====================================================

// THINK QUESTION - STEP 5:
// Why does the number stay on the left without keys?
//
// ANSWER:
// Without keys, Flutter matches widgets by type
// and position in the widget tree.
//
// The Element and its State stay at the same position.
// When widgets swap, the label changes but the tap
// counter may remain at the old position.
//
// ValueKey allows Flutter to identify each Tile
// so its State follows it when its position changes.

class SwapBoard extends StatefulWidget {
  const SwapBoard({super.key});

  @override
  State<SwapBoard> createState() => _SwapBoardState();
}

class _SwapBoardState extends State<SwapBoard> {
  // Each Tile has a unique ValueKey based on its label.

  var tiles = [
    Tile(tileA, key: ValueKey(tileA)),
    Tile(tileB, key: ValueKey(tileB)),
    Tile(tileC, key: ValueKey(tileC)),
  ];

  // Reverse the order of the Tiles.
  void swap() => setState(
        () => tiles = tiles.reversed.toList(),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display tiles horizontally.
        Row(
          children: tiles,
        ),

        // Button that reverses the tile order.
        ElevatedButton(
          key: const Key('swap'),
          onPressed: swap,
          child: const Text('Swap'),
        ),
      ],
    );
  }
}

 // =====================================================
 // STEP 6 - ROW AND COLUMN ALIGNMENT
 // =====================================================

 // THINK QUESTION - STEP 6:
 // In a Column, the main axis is vertical.
 // The cross axis is horizontal.
 // CrossAxisAlignment.center moves children horizontally
 // because it aligns them on the cross axis.

 class InfoPanel extends StatelessWidget {
   const InfoPanel({super.key});

   @override
   Widget build(BuildContext context) {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         // ROW: arrange three texts horizontally.
         Row(
           key: const Key('info-row'),
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Text(
               'Start: $startSec s',
               key: const Key('row-a'),
             ),
             Text(
               'Tick: $tick s',
               key: const Key('row-b'),
             ),
             Text(
               'Stop: $stopAt s',
               key: const Key('row-c'),
             ),
           ],
         ),

         const SizedBox(height: 12),

         // COLUMN: arrange three texts vertically.
         Column(
           key: const Key('info-col'),
           crossAxisAlignment: CrossAxisAlignment.end,
           children: [
             Text(
               'Name: $studentName',
               key: const Key('col-a'),
             ),
             Text(
               'Roll no: $rollNo',
               key: const Key('col-b'),
             ),
             Text(
               'Course: $course',
               key: const Key('col-c'),
             ),
           ],
         ),
       ],
     );
   }
 }



 // =====================================================
 // STEP 8 - EXPANDED VS FLEXIBLE
 // =====================================================

 // THINK QUESTION - STEP 8:
 // What happens if Expanded and Flexible are swapped?
 //
 // ANSWER:
 // Expanded fills all of its allocated space.
 // Flexible can take less space than allocated.
 // If swapped, the Exp button may become smaller,
 // while the Flex button will stretch.
 //
 // Expanded is Flexible with FlexFit.tight.

 class ShareRow extends StatelessWidget {
   const ShareRow({super.key});

   @override
   Widget build(BuildContext context) {
     return Row(
       key: const Key('share-row'),
       children: [
         // First button has a fixed width.
         SizedBox(
           key: const Key('fixed'),
           width: fixedW,
           child: ElevatedButton(
             onPressed: () {},
             child: const Text('F'),
           ),
         ),

         // Expanded fills its allocated width.
         Expanded(
           flex: flexA,
           child: ElevatedButton(
             key: const Key('exp'),
             onPressed: () {},
             child: const Text('Exp'),
           ),
         ),

         // Flexible may use less than its allocation.
         Flexible(
           flex: flexB,
           child: ElevatedButton(
             key: const Key('flex'),
             onPressed: () {},
             child: const Text('Flex'),
           ),
         ),
       ],
     );
   }
 }
