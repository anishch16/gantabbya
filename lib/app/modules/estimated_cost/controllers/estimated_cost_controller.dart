import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../set_destination/controllers/args_model.dart';

class EstimatedCostController extends GetxController {
  TravelCostDetails args = Get.arguments;
  final box = GetStorage();
  List<HistoryModel> models = [];
clearData(){
  box.remove('models');
}
saveData() {
  HistoryModel newData = HistoryModel(
    userName: box.read('user'),
    destinationName: args.location,
    date: args.startDate,
    travelType: args.selectedAir.price != null ? "By Air" : "By Bus",
    travelCompanyName: args.selectedAir.price != null
        ? args.selectedAir.name ?? ""
        : args.selectedBus.name ?? "",
    travelPrice: args.selectedAir.price != null
        ? args.selectedAir.price.toString()
        : args.selectedBus.price.toString(),
    lodgeName: args.selectedLodge.name ?? "",
    lodgePrice: args.selectedLodge.price.toString(),
  );
  List storedData = box.read('models') ?? [];
  List<Map<String, dynamic>> dataToStore = [
    ...storedData.cast<Map<String, dynamic>>(), 
    newData.toMap()
  ];

  box.write('models', dataToStore);
}


  // Future<void> insertTravelCostDetails() async {
  //   String currentUser = "anish";

  //   Map<String, dynamic> travelCostDetailRow = {
  //     'username': currentUser, // Add username
  //     'destination_name': args.location,
  //     'total_price': (args.selectedAir.price ?? 0) +
  //         (args.selectedBus.price ?? 0) +
  //         (args.selectedLodge.price ?? 0),
  //     'date': args.startDate,
  //     'travel_type': args.selectedAir.price != null ? "By Air" : "By Bus",
  //     'travel_company_name': args.selectedAir.price != null
  //         ? args.selectedAir.name
  //         : args.selectedBus.name,
  //     'travel_price': args.selectedAir.price ?? args.selectedBus.price,
  //     'lodge_name': args.selectedLodge.name,
  //     'lodge_price': args.selectedLodge.price,
  //   };

  //   try {
  //     int id = await DatabaseHelper.instance
  //         .insertTravelCostDetails(travelCostDetailRow);
  //     print('Inserted TravelCostDetails with ID: $id');
  //   } catch (e) {
  //     print("Error inserting travel cost details: $e");
  //   }
  // }
}

class HistoryModel {
  final String destinationName;
  final String date;
  final String travelType;
  final String travelCompanyName;
  final String travelPrice;
  final String lodgeName;
  final String lodgePrice;
  final String userName;

  HistoryModel({
    required this.destinationName,
    required this.date,
    required this.travelType,
    required this.travelCompanyName,
    required this.travelPrice,
    required this.lodgeName,
    required this.lodgePrice,
    required this.userName,
  });

  Map<String, dynamic> toMap() {
    return {
      'destination_name': destinationName,
      'date': date,
      'travel_type': travelType,
      'travel_company_name': travelCompanyName,
      'travel_price': travelPrice,
      'lodge_name': lodgeName,
      'lodge_price': lodgePrice,
      'username': userName
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      destinationName: map['destination_name'],
      date: map['date'],
      travelType: map['travel_type'],
      travelCompanyName: map['travel_company_name'],
      travelPrice: map['travel_price'],
      lodgeName: map['lodge_name'],
      lodgePrice: map['lodge_price'],
      userName: map['username'],
    );
  }
}
