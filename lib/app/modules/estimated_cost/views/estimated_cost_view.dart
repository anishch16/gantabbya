import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../routes/app_pages.dart';
import '../../cost_details/views/cost_details_view.dart';
import '../controllers/estimated_cost_controller.dart';
import 'no_data_card.dart';

class EstimatedCostView extends GetView<EstimatedCostController> {
  const EstimatedCostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          children: [
            Expanded(
                child: _buildBackButton(
              title: "Back Home",
              color: Colors.teal,
              onTap: () => Get.offNamed(Routes.HOME),
            )),
            const SizedBox(width: 8.0),
            Expanded(
                child: _buildBackButton(
              color: AppColors.green,
              title: "Save Trip",
              onTap: () {
                controller.saveData();
                Get.offNamed(Routes.HOME);
              },
            )),
          ],
        ),
        body: _buildTabView(),
      ),
    );
  }

  // AppBar widget
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Text(
        "Plan your trip with us",
        style: AppTextStyles.smallStyle.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
      ),
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
    );
  }

  // Back button widget
  Widget _buildBackButton(
      {required String title,
      required void Function() onTap,
      required Color color}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.miniStyle
                .copyWith(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Tab View with content
  Widget _buildTabView() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.black),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Choices",
                  style: AppTextStyles.normalStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                if (controller.args.selectedBus.price != null)
                  CostCard(
                    title: "Bus",
                    cost: controller.args.selectedBus.price.toString(),
                  ),
                if (controller.args.selectedAir.price != null)
                  CostCard(
                    title: "Airline",
                    cost: controller.args.selectedAir.price.toString(),
                  ),
                if (controller.args.selectedLodge.price != null)
                  CostCard(
                    title: "Hotel",
                    cost: controller.args.selectedLodge.price.toString(),
                  ),
                const Divider(),
                Row(
                  children: [
                    Text(
                      "Total",
                      style: AppTextStyles.normalStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                        "Rs. ${(controller.args.selectedBus.price ?? 0) + (controller.args.selectedAir.price ?? 0) + (controller.args.selectedLodge.price ?? 0)}",
                        style: AppTextStyles.normalStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.green,
                        ))
                  ],
                )
              ],
            ),
          ),
          Text(
            "Recommended Choices",
            style: AppTextStyles.normalStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "These choices are recommended for you. These are based on the cheapest cost and the rating of their one.",
            textAlign: TextAlign.center,
            style: AppTextStyles.miniStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              children: [
                _buildAirlinesTab(),
                _buildBusesTab(),
                _buildLodgesTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // TabBar widget
  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
            16), // Circular border for the tab bar container
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.5,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      height: 50,
      child: TabBar(
        dividerHeight: 0,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        indicator: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(12),
        ),
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        tabs: const [
          Tab(
            child: Text(
              'Airlines',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Tab(
            child: Text(
              'Buses',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Tab(
            child: Text(
              'Lodges',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  // Airlines Tab content
  Widget _buildAirlinesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(
        children: [
          (controller.args.optimalAir.price != null)
              ? _buildTransportationCard(
                  controller.args.optimalAir,
                  "Kathmandu",
                  controller.args.location,
                  Icons.flight,
                )
              : const NoSelectionMessage(
                  title: "No Airlines Available",
                  icon: Icons.flight,
                ),
        ],
      ),
    );
  }

  // Buses Tab content
  Widget _buildBusesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(
        children: [
          (controller.args.optimalBus.price != null)
              ? _buildTransportationCard(
                  controller.args.optimalBus,
                  "Kathmandu",
                  controller.args.location,
                  Icons.directions_bus,
                )
              : const NoSelectionMessage(
                  title: "No Bus Available",
                  icon: Icons.directions_bus,
                )
        ],
      ),
    );
  }

  // Lodges Tab content
  Widget _buildLodgesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(
        children: [
          (controller.args.optimalLodge.price != null)
              ? _buildHotelCard(controller.args.optimalLodge)
              : const NoSelectionMessage(
                  title: "No Lodges Available", icon: Icons.hotel)
        ],
      ),
    );
  }

  // TransportationCard widget
  Widget _buildTransportationCard(
      dynamic transport, String startPoint, String endPoint, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TransportationCard(
        price: transport.price.toString(),
        remarks: transport.remarks ?? "",
        onTap: () {},
        isSelected: true,
        startPoint: startPoint,
        endPoint: endPoint,
        title: transport.name ?? "",
        icon: Icon(icon, color: Colors.teal, size: 40),
        startTime: '',
        endTime: '',
      ),
    );
  }

  // HotelCard widget
  Widget _buildHotelCard(dynamic lodge) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: HotelCard(
        price: lodge.price.toString(),
        onTap: () {},
        isSelected: true,
        title: lodge.name ?? "",
        subTitle: lodge.remarks ?? "",
      ),
    );
  }
}

class CostCard extends StatelessWidget {
  final String? title;
  final String? cost;
  const CostCard({
    super.key,
    this.title,
    this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(
            title == "Bus"
                ? Icons.directions_bus
                : title == "Airline"
                    ? Icons.flight
                    : Icons.hotel,
            color: AppColors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          Text("Selected $title",
              style: AppTextStyles.normalStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              )),
          const Spacer(),
          Text("Rs. $cost",
              style: AppTextStyles.normalStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.green,
              )),
        ],
      ),
    );
  }
}
