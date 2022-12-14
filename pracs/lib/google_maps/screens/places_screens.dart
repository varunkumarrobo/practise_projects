import 'package:flutter/material.dart';
import 'package:pracs/google_maps/screens/single_city.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> cityList = const [
    {
      'address': "Jaipur the Pink City",
      'id': 'jaipur 01',
      'image':
          'https://media.istockphoto.com/photos/hawa-mahal-jaipur-india-picture-id482557081?k=20&m=482557081&s=612x612&w=0&h=LontnFctJTY--euwLwo1fsdkt3YNiDtLoCa2HtDSpnE=',
      'lat': 26.922878,
      'lng': 75.778885,
      'name': 'Jaipur India',
      'phone': '9620208254',
      'region': 'South Asia',
    },
    {
      'address': "Bengaluru the city of Diverse Existence",
      'id': 'Bengaluru 02',
      'image':
          'https://media.istockphoto.com/photos/bangalore-skyline-india-picture-id186255464?k=20&m=186255464&s=612x612&w=0&h=JwyYAoDbEl46B84f_33eboB2AdaogQ_mJWBHko6hg1w=',
      'lat': 12.971599,
      'lng': 77.594566,
      'name': 'Bengaluru India',
      'phone': '9620206254',
      'region': 'South Asia',
    },
    {
      'address': "Kolkata the cultural capital of India",
      'id': 'Kolkata 03',
      'image':
          'https://media.istockphoto.com/photos/the-last-sailors-sunset-picture-id504701694?k=20&m=504701694&s=612x612&w=0&h=kyXcmm4K90iRU4-5WsftyhQoPABZcMRQjxuXh2kyn4o=',
      'lat': 22.572645,
      'lng': 88.363892,
      'name': 'Kolkata India',
      'phone': '9620204254',
      'region': 'South Asia',
    },
    {
      'address': "Udaipur City of Love",
      'id': 'Udaipur 04',
      'image':
          'https://media.istockphoto.com/photos/udaipur-lake-palace-picture-id157569856?k=20&m=157569856&s=612x612&w=0&h=cFAVp5uP0jE6x6-M8W_ufX7V8BblfVclK1K5U3j_aJw=',
      'lat': 24.571270,
      'lng': 73.691544,
      'name': 'Udaipur India',
      'phone': '9620202254',
      'region': 'South Asia',
    }
  ];

  getDetails(Map singleCityData, BuildContext context) {
    print(singleCityData);
    Navigator.push(context, MaterialPageRoute(builder: (context)=> SingleCity(
      cityData: singleCityData,
    ),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Famous City\'sof India'),
      ),
      body: ListView.builder(
        itemCount: cityList.length,
          itemBuilder: (context, index){
        return Card(
          elevation: 5,
            child: Column(
              children: [
                Image.network(
                  cityList[index]['image'],
                height: 200,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding:const EdgeInsets.only(left: 10),
                    child: Text(
                      cityList[index]['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                    ElevatedButton(onPressed: (){
                      getDetails(cityList[index], context);
                    }, child: const Text('View Details'))
                  ],
                )
              ],
            ),
        );
      }),
    );
  }
}
