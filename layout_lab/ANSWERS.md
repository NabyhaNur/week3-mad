
# CS442 Week 7 - Team Board Lab

Name: NABIHA NOOR
Roll Number: 04072312022
Seed: 22

## Numerical Answers

A1: 33
A2: 7
A3: 4
A4: 75

## Written Answers

### B1: Stateless and Stateful Classes

StatelessWidget classes:
LabApp, HomePage, SettingsCard, SummaryRow,
Probe, Welcome, InfoPanel, ShareRow,
InfoBox, StampStack.

These widgets do not manage their own changing State.

StatefulWidget classes:
Clock, Tile, SwapBoard.

Clock is Stateful because its timer updates the seconds.
Tile is Stateful because its tap counter changes.
SwapBoard is Stateful because the order of tiles changes.

### B2: Widget, Element and RenderObject

A Widget is a lightweight description of the UI.
A new Widget object can be created during a rebuild.

The Element usually stays in the widget tree when
the widget type and key remain compatible.
It maintains the connection between widgets and State.

RenderObject handles layout, size, position and painting.
It can also be reused during rebuilds.

The Probe experiment showed that the Widget identity
changed while the Element identity stayed the same.

### B3: Constraints Go Down, Sizes Go Up

In Flutter, the parent sends layout constraints
to its children.

The children choose their sizes within those
constraints and report their sizes back.

In Step 7, Expanded gave each Text a limited
share of the Row's available width.

Because of these width constraints, the Text
wrapped onto multiple lines instead of overflowing.
