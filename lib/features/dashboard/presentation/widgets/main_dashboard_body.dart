import 'package:business_tracker/config/styles/app_dimensions.dart';
import 'package:business_tracker/features/dashboard/presentation/widgets/main_body/payment_overview_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainDashboardBody extends StatefulWidget {
  const MainDashboardBody({super.key});

  @override
  State<MainDashboardBody> createState() => _MainDashboardBodyState();
}

class _MainDashboardBodyState extends State<MainDashboardBody> {
  List<String> list = <String>['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    final dimesions = AppDimensions(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: dimesions.pagePaddingGlobal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/whatspp_icon/whatsapp-16.svg',
                      height: dimesions.screenWidth * .07,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.message,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: SvgPicture.asset(
                  //     'assets/icons/youtube.svg',
                  //     height: dimesions.screenWidth * .08,
                  //   ),
                  // ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_circle,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.help,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.refresh_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPaymentOverviewCards(dimesions),
        ],
      ),
    );
  }

  Widget _buildPaymentOverviewCards(AppDimensions dimensions) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: dimensions.isMobile
            ? 1
            : 2, // One column for mobile, two for other screens
        crossAxisSpacing: 16.0, // Spacing between columns
        mainAxisSpacing: 16.0, // Spacing between rows
        childAspectRatio: dimensions.isTablet
            ? 1.3
            : 1.9, // Adjusts the height of the grid cells
      ),
      itemCount: 6, // Number of PaymentOverviewCard widgets
      itemBuilder: (context, index) => PaymentOverviewCard(),
    );
  }
}
