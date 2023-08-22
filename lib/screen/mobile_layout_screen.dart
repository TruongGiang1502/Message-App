import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:message_app/common/utils/colors.dart';
import 'package:message_app/features/select_contact/screens/select_contact_screen.dart';
import 'package:message_app/widget/contacts_list.dart';

class MobileLayoutScreen extends ConsumerStatefulWidget {
  static const routeName = '/mobile_screen_layout';
  const MobileLayoutScreen({super.key});

  @override
  ConsumerState<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends ConsumerState<MobileLayoutScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {

      
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: appBarColor,
            centerTitle: false,
            title: const Text(
              'Message App',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                  )),
            ],
            bottom: const TabBar(
              indicatorColor: tabColor,
              indicatorWeight: 4,
              labelColor: tabColor,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: 'Chat',
                ),
                Tab(text: 'Status'),
                Tab(
                  text: 'Calls',
                )
              ],
            ),
          ),
          body: const ContactsList(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, SelectContactScreen.routeName);
            },
            backgroundColor: tabColor,
            child: const Icon(
              Icons.comment,
              color: Colors.white,
            ),
          ),
        ));
  }
}
