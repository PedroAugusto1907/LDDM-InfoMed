import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:info_med/custom_appbar.dart';
import 'package:info_med/models/localizacao.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<Maps> {
  late GoogleMapController _mapController;

  LatLng _initialPosition = const LatLng(-23.55052, -46.633308);
  final Set<Marker> _markers = {};

  final String _googleApiKey = 'GOOGLE_API_KEY';
  bool _dataFetched = false;
  int _pharmacyCount = 0;

  Future<void> _initializeLocation() async {
    if (_dataFetched) return;
    _dataFetched = true;

    final localizacao = Localizacao();
    await localizacao.getPosicao();

    if (localizacao.erro.isNotEmpty) {
      print("Erro ao obter localização: ${localizacao.erro}");
      return;
    }

    setState(() {
      _initialPosition = LatLng(localizacao.latitude, localizacao.longitude);
      _markers.add(
        Marker(
          markerId: const MarkerId('initialPosition'),
          position: _initialPosition,
          infoWindow: const InfoWindow(title: 'Minha Localização Inicial'),
        ),
      );
    });

    await _fetchNearbyPharmacies(_initialPosition);
  }

  Future<void> _fetchNearbyPharmacies(LatLng position) async {
    const String url = 'https://places.googleapis.com/v1/places:searchNearby';

    final Map<String, dynamic> body = {
      "includedTypes": ["drugstore"],
      "maxResultCount": 20,
      "locationRestriction": {
        "circle": {
          "center": {"latitude": position.latitude, "longitude": position.longitude},
          "radius": 1000
        }
      }
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'X-Goog-Api-Key': _googleApiKey,
          'X-Goog-FieldMask': 'places.displayName,places.location,places.regularOpeningHours',
        },
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['places'] != null && data['places'].isNotEmpty) {
          setState(() {
            _pharmacyCount = data['places'].length;
          });

          for (var place in data['places']) {
            final LatLng pharmacyLocation = LatLng(
              place['location']['latitude'],
              place['location']['longitude'],
            );

            _markers.add(
              Marker(
                markerId: MarkerId(place['displayName']['text']),
                position: pharmacyLocation,
                icon: BitmapDescriptor.defaultMarkerWithHue(174),
                infoWindow: InfoWindow(
                  title: '${place['displayName']['text']} - ${place['regularOpeningHours']['openNow'] == true ? 'Aberto' : 'Fechado'}',
                ),
              ),
            );
          }

          setState(() {});
        } else {
          setState(() {
            _pharmacyCount = 0;
          });
        }
      } else {
        print('Erro ao buscar farmácias: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Erro ao buscar farmácias: $e');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: FutureBuilder(
        future: _initializeLocation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar o mapa: ${snapshot.error}'),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Farmácias Próximas',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _initialPosition,
                      zoom: 15.0,
                    ),
                    markers: _markers,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  _pharmacyCount > 0
                      ? '${_pharmacyCount} farmácia(s) encontrada(s)'
                      : 'Nenhuma farmácia encontrada',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
