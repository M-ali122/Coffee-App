import 'package:coffee_app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/tracking_controller.dart';

class TrackingView extends StatelessWidget {
  final tc = Get.put(TrackingController());

  @override
  Widget build(BuildContext context) {
    tc.startTracking();
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(
        child: Column(
          children: [
            // pseudo-map area (use Google Maps plugin for real map)
            Container(
              height: 420,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(child: Text('Map placeholder', style: TextStyle(color: AppColors.greyText))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Text('10 minutes left', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      LinearProgressIndicator(value: 0.6),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          CircleAvatar(backgroundImage: AssetImage('assets/images/delivery_person.png')),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Johan Hawn', style: TextStyle(fontWeight: FontWeight.w600)),
                              Text('Personal Courier', style: TextStyle(color: AppColors.greyText)),
                            ],
                          ),
                          Spacer(),
                          IconButton(onPressed: () {}, icon: Icon(Icons.call, color: AppColors.primary))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
