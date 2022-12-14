
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pracs1/models/auto_complete.dart';


final placeResultsProvider = ChangeNotifierProvider<PlaceResults>((ref){
  return PlaceResults();
});

final searchToggleProvider = ChangeNotifierProvider<SearchToggle>((ref) {
  return SearchToggle();
});


class PlaceResults  extends ChangeNotifier {
  List<AutoCompleteResult> allReturnedResults = [];

  void setResults(allPlaces){
    allReturnedResults = allPlaces;
    notifyListeners();
  }
}
class SearchToggle extends ChangeNotifier{
 bool searchToggle = false;

  void toggleSearch(){
    searchToggle = searchToggle;
    notifyListeners();
  }
}
// class SearchPlacesScreen extends StatefulWidget {
//   const SearchPlacesScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SearchPlacesScreen> createState() => _SearchPlacesScreenState();
// }
//
// class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
