import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantau_pasien/page/chat/main_chat.dart';
import 'package:pantau_pasien/page/dashboard/main_dashboard.dart';
import 'package:pantau_pasien/page/pasien/detail_pasien/main_detail_patient.dart';
import 'package:pantau_pasien/page/pasien/main_patient.dart';
import 'package:pantau_pasien/page/profile/main_profile.dart';

class BottomNavigationMain extends StatefulWidget {
  @override
  _BottomNavigationMainState createState() => _BottomNavigationMainState();
}

class _BottomNavigationMainState extends State<BottomNavigationMain> {
  int _currentIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentIndex].currentState.maybePop();

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
        child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: SizedBox(
          height: 80.0,
                  child: BottomNavigationBar(   
            backgroundColor: Colors.white,     
            currentIndex: _currentIndex,
            elevation: 30.0,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home,size: 30.0,),
                title: Text("Dashboard"),
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,size: 30.0,),
                title: Text("Profile"),
                backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat,size: 30.0,),
                title: Text("Chat perawat"),
                backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people,size: 30.0,),
                title: Text("Pasien"),
                backgroundColor: Colors.blue
              ),
            ],
            onTap: (index){
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
          ],
        )
      ),
    );
  }

  void detailPatient() {
    Get.to(MainDetailPatient());
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          MainDashboardPage(),
          MainProfilePage(),
          MainChatPage(),
          MainPatientPage(
            next: detailPatient,
          )
        ].elementAt(index);
      },
    };
}

Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _currentIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        },
      ),
    );
  }
}


