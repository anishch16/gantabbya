import '../../../data/remote/models/bus_air_hotel_model.dart';

class TravelCostDetails {
  final String startDate;
  final String endDate;
  final String location;
  final BusAirHotelData optimalBus;
  final BusAirHotelData optimalAir;
  final BusAirHotelData optimalLodge;
  final BusAirHotelData selectedBus;
  final BusAirHotelData selectedAir;
  final BusAirHotelData selectedLodge;

  TravelCostDetails({
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.optimalBus,
    required this.optimalAir,
    required this.optimalLodge,
    required this.selectedBus,
    required this.selectedAir,
    required this.selectedLodge,
  });
}
