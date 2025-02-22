import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../constants/styles.dart';
import '../../../routes/app_pages.dart';
import '../../cost_details/views/cost_details_view.dart';
import '../controllers/estimated_cost_controller.dart';
import 'no_data_card.dart';
import 'title_card.dart';

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
        floatingActionButton: _buildBackButton(),
        body: _buildBody(),
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
  Widget _buildBackButton() {
    return GestureDetector(
      onTap: () {
        Get.offAllNamed(Routes.HOME);
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.teal,
        ),
        child: Center(
          child: Text(
            "Back to Home",
            style: AppTextStyles.miniStyle
                .copyWith(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Body content widget
  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.2,
            blurRadius: 0.2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildTabView()),
        ],
      ),
    );
  }

  // Header with background image
  Widget _buildHeader() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: Image.asset(AppImages.planeBackground),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppImages.gantabyaLogoPng, height: 40, width: 40),
                  const SizedBox(width: 16),
                  Text(
                    "Travel Choices",
                    style: AppTextStyles.normalStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Tab View with content
  Widget _buildTabView() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
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
          Column(
            children: [
              const TitleContainer(
                icon: Icons.flight,
                title: "Selected Airline",
              ),
              (controller.args.selectedAir.price != null)
                  ? _buildTransportationCard(
                      controller.args.selectedAir,
                      "Kathmandu",
                      controller.args.location,
                      Icons.flight,
                    )
                  : const NoSelectionMessage(
                      title: "No Airline Selected",
                      icon: Icons.flight,
                    ),
            ],
          ),
          Column(
            children: [
              const TitleContainer(
                icon: Icons.flight,
                title: "Cheapest Airline",
              ),
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
          (controller.args.selectedBus.price != null)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleContainer(
                      icon: Icons.directions_bus,
                      title: "Selected Bus",
                    ),
                    _buildTransportationCard(
                      controller.args.selectedBus,
                      "Kathmandu",
                      controller.args.location,
                      Icons.directions_bus,
                    ),
                  ],
                )
              : const NoSelectionMessage(
                  title: "No Bus Selected",
                  icon: Icons.directions_bus,
                ),
          Column(
            children: [
              const TitleContainer(
                icon: Icons.directions_bus,
                title: "Cheapest Bus",
              ),
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
                    ),
            ],
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
          Column(
            children: [
              const TitleContainer(
                icon: Icons.hotel,
                title: "Selected Hotel",
              ),
              (controller.args.selectedLodge.price != null)
                  ? _buildHotelCard(controller.args.selectedLodge)
                  : const NoSelectionMessage(
                      title: "No Lodge Selected", icon: Icons.hotel),
            ],
          ),
          Column(
            children: [
              const TitleContainer(
                icon: Icons.hotel,
                title: "Cheapest Hotel",
              ),
              (controller.args.optimalLodge.price != null)
                  ? _buildHotelCard(controller.args.optimalLodge)
                  : const NoSelectionMessage(
                      title: "No Lodges Available", icon: Icons.hotel),
            ],
          )
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
