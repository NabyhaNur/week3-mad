# Study Tracker Lab Answers

Name: Nabiha Noor
Roll No: 04072312022

A1: 7
A2: 10
A3: 9
A4: 20


B1: LabApp, HomePage, StudentCard, and GoalBanner are StatelessWidgets because they do not manage changing state. Tally, BuggyCounter, CountdownTimer, and LifecycleDemo are StatefulWidgets because their data changes during execution.

B2: The Timer must be cancelled in dispose() to prevent it from running after the widget is removed. Otherwise, it may cause a setState() called after dispose() error.

B3: LabApp, HomePage, Tally, BuggyCounter, CountdownTimer, and LifecycleDemo can use const constructors. const reduces unnecessary object creation and helps Flutter optimize widget rebuilding.