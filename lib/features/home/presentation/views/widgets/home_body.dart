import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:uber_clone/features/home/presentation/manager/current_location_bloc/current_location_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late final MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController();

    context.read<CurrentLocationBloc>().add(GetCurrentLocationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrentLocationBloc, CurrentLocationState>(
      listener: (context, state) {
        if (state is CurrentLocationSuccess) {
          mapController.move(
            LatLng(
              state.userLocationEntity.latitude,
              state.userLocationEntity.longitude,
            ),
            mapController.camera.zoom == 0 ? 16 : mapController.camera.zoom,
          );
        }
      },
      builder: (context, state) {
        if (state is CurrentLocationLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CurrentLocationError) {
          return Center(child: Text(state.message));
        }

        LatLng currentLocation = const LatLng(30.0444, 31.2357);

        if (state is CurrentLocationSuccess) {
          currentLocation = LatLng(
            state.userLocationEntity.latitude,
            state.userLocationEntity.longitude,
          );
        }
        return Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: currentLocation,
                initialZoom: 16,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.basemaps.cartocdn.com/dark_nolabels/{z}/{x}/{y}{r}.png',
                  subdomains: const ['a', 'b', 'c', 'd'],
                  userAgentPackageName: 'com.example.uber_clone',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: currentLocation,
                      width: 50,
                      height: 50,
                      child: const Icon(
                        Icons.my_location,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 60,
              left: 16,
              right: 16,
              child: Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {},
                  child: Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 12),
                        Text("Where to?", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 16,
              child: FloatingActionButton.small(
                heroTag: "location",
                onPressed: () {
                  context.read<CurrentLocationBloc>().add(
                    GetCurrentLocationEvent(),
                  );
                },
                child: const Icon(Icons.my_location),
              ),
            ),
          ],
        );
      },
    );
  }
}
