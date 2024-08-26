import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/dashboard/presentation/widgets/main_dashboard_body.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../common/presentation/widgets/CustomAppBar/custom_app_bar.dart';
import '../widgets/sliding_up_panel.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = 'dashboard_page';

  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PanelController _panelController = PanelController();
  bool _isPanelOpen = false;
  @override
  Widget build(BuildContext context) {
    final dimensions = AppDimensions(context);
    var slidingPanelTopRadius = dimensions.screenWidth * .040;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Dashboard',
      ),
      body: GestureDetector(
        onTap: () {
          if (_panelController.isPanelOpen) {
            _panelController.close();
          }
        },
        child: Stack(
          children: [
            MainDashboardBody(),
            SlidingUpPanel(
              controller: _panelController,
              maxHeight: dimensions.screenHeight * 0.75,
              minHeight: dimensions.screenHeight * 0.18,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(slidingPanelTopRadius),
                topRight: Radius.circular(slidingPanelTopRadius),
              ),
              onPanelSlide: (position) {
                setState(() {
                  _isPanelOpen = position > 0.9;
                });
              },
              header: Container(
                width: dimensions.screenWidth,
                // height: dimensions.screenHeight * 0.05,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        if (_panelController.isPanelOpen) {
                          _panelController.close();
                        } else {
                          _panelController.open();
                        }
                      },
                      icon: Icon(
                        _isPanelOpen
                            ? Icons.expand_more // Icon for expanded state
                            : Icons.expand_less,
                        color: Theme.of(context).colorScheme.secondary,
                        size: dimensions.screenWidth * .10,
                      ),
                    )
                  ],
                ),
              ),
              panel: SlidingUpPanelWidget(),
              body: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
