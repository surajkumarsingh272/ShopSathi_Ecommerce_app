import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sathi_app/Change_Delivery_Address/notification_provider.dart';

import 'notification_list.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    final notificationProvider = Provider.of<NotificationProvider>(context, listen: false);
    notificationProvider.getAllNotificationData();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: SizedBox(height: 35,width: 35,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),color: Colors.white,
                child: Icon(Icons.arrow_back,color: Colors.black,)),
          ),
        ),
          centerTitle: true,
          title: Text("Notification",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
        actions: [
          SizedBox(height: 45,width: 45,
            child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),color: Colors.white,
                child: Icon(Icons.more_horiz,color: Colors.black,)),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 2,
            pinned: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 60,
            title: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search, size: 20),
                        hintText: "Search address by name",
                        hintStyle: const TextStyle(fontSize: 13),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
                final notification = provider.notificationList[index];
                List<Widget> widgets = [];
                if (index == 0) {
                  widgets.add(
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(notification.dayStatus, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                    ),
                  );
                }
                if (index == 4) {
                  widgets.add(
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16,),
                      child: Text(notification.dayStatus, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
                    ),
                  );
                }
                widgets.add(
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(radius: 20, backgroundColor: Colors.yellow[100],
                          child: Icon(Icons.discount, color: Colors.yellow[800]),
                        ),

                        SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(notification.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                              SizedBox(height: 4),

                              Row(
                                children: [
                                  Expanded(
                                    child: Text(notification.subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold,)),
                                  ),
                                  Icon(Icons.circle, size: 10, color: Colors.red),
                                ],
                              ),

                              SizedBox(height: 6),

                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  notification.createdAt,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widgets,
                );
              },
              childCount: provider.notificationList.length,
            ),
          )

        ],
      ),
    );
  }
}
