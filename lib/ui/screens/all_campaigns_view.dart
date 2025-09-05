import 'package:cryptoback_business_app/widgets/custom_app_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/bottom sheets/campagin_detail.dart';
import '../../widgets/campaign_tile.dart';

class AllCampaignsScreen extends ConsumerWidget {
  const AllCampaignsScreen({super.key});

  @override
  Widget build(BuildContext context, watchRef) {
    return Scaffold(
      appBar: CustomAppBar2(title: 'All Campaigns', showActionButton: false),
      body: Padding(
        padding: EdgeInsets.all(20.w),

        child: Column(
          children: [
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final campaigns = getCampaignsData();
                  return ListView.builder(
                    itemCount: campaigns.length,
                    itemBuilder: (context, index) {
                      final campaign = campaigns[index];
                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            //  backgroundColor: Colors.,
                            builder: (context) => CampaignDetailBottomSheet(),
                          );
                        },
                        child: CampaignTile(
                          title: campaign.title,
                          type: campaign.type,
                          date: campaign.date,
                          amount: campaign.date,
                          id: campaign.id,
                          isActive: campaign.isActive,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<CampaignModel> getCampaignsData() {
  return [
    CampaignModel(
      type: 'Percentage',
      title: 'Black Friday Sale',
      date: '26 Apr 2025, 09:00 am',
      id: '14545782',
      isActive: true,
    ),
    CampaignModel(
      type: 'Percentage',
      title: 'Black Friday Sale',
      date: '26 Apr 2025, 09:00 am',
      id: '14545782',
      isActive: true,
    ),
    CampaignModel(
      type: 'Fixed Price',
      title: 'Black Friday Sale',
      date: '26 Apr 2025, 09:00 am',
      id: '14545782',
      isActive: true,
    ),
    CampaignModel(
      type: 'Fixed Price',
      title: 'Black Friday Sale',
      date: '26 Apr 2025, 09:00 am',
      id: '14545782',
      isActive: true,
    ),
    CampaignModel(
      type: 'Percentage',
      title: 'Black Friday Sale',
      date: '26 Apr 2025, 09:00 am',
      id: '14545782',
      isActive: false,
    ),
    CampaignModel(
      type: 'Fixed Price',
      title: 'Black Friday Sale',
      date: '26 Apr 2025, 09:00 am',
      id: '14545782',
      isActive: false,
    ),
    CampaignModel(
      type: 'Fixed Price',
      title: 'Black Friday Sale',
      date: '26 Apr 2025, 09:00 am',
      id: '14545782',
      isActive: false,
    ),
    CampaignModel(
      type: 'Percentage',
      title: 'Black Friday Sale',
      date: '26 Apr 2025, 09:00 am',
      id: '14545782',
      isActive: false,
    ),
    CampaignModel(
      type: 'Fixed Price',
      title: 'Black Friday Sale',
      date: '26 Apr 2025, 09:00 am',
      id: '14545782',
      isActive: false,
    ),
  ];
}

class CampaignModel {
  final String type;
  final String title;
  final String date;
  final String id;
  final bool isActive;

  CampaignModel({
    required this.type,
    required this.title,
    required this.date,
    required this.id,
    required this.isActive,
  });
}
