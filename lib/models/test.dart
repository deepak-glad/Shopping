import 'package:flutter/material.dart';
import 'package:sliding_panel/sliding_panel.dart';

class TextPanel extends StatefulWidget {
  @override
  _TextPanelState createState() => _TextPanelState();
}

class _TextPanelState extends State<TextPanel> {
  PanelController pc;
  @override
  void initState() {
    super.initState();
    pc = PanelController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panel'),
      ),
      body: SlidingPanel(
        panelController: pc,
        content: PanelContent(
          headerWidget: PanelHeaderWidget(
            headerContent: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'This is a SlidingPanel',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            options: PanelHeaderOptions(centerTitle: true),
          ),

          // The only REQUIRED parameter
          panelContent: List.generate(20, (i) {
            return ListTile(
              onTap: () {},
              title: Text('Item : ${i + 1}'),
            );
          }).toList(),

          bodyContent: Center(
            child: RaisedButton(
              onPressed: () {
                pc.collapse();
              },
              child: Text('Open the panel'),
            ),
          ),
        ),
        size: PanelSize(closedHeight: 0.0),
        // apply snapping effect
        snapping: PanelSnapping.enabled,
      ),
    );
  }
}
