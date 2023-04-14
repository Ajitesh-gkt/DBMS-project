import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // color: color(context.cardColor),
        color: Colors.grey[900],
        child: ListView(
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              //  margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                accountName: Text('name'),
                accountEmail: Text('email'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.shutterstock.com/image-vector/businessman-icon-can-be-used-260nw-247098721.jpg'),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.person_alt, color: Colors.white),
              title: Text(
                'Account',
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.3,
              ),
            ),
            ListTile(
              leading:
                  const Icon(CupertinoIcons.car_detailed, color: Colors.white),
              title: const Text(
                'put a car on rent',
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.3,
              ),
              onTap: () => Navigator.pushNamed(context, "/addCar"),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white),
              title: Text(
                'Email',
                style: TextStyle(color: Colors.white),
                selectionColor: Colors.white,
                textScaleFactor: 1.3,
              ),
            ),
            ListTile(
              leading:
                  const Icon(CupertinoIcons.person_3_fill, color: Colors.white),
              title: const Text(
                "Renters' list",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.3,
              ),
              onTap: () => Navigator.pushNamed(context, "/renters"),
            ),
            ListTile(
              leading:
              const Icon(CupertinoIcons.person_3_fill, color: Colors.white),
              title: const Text(
                "Car list",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.3,
              ),
              onTap: () => Navigator.pushNamed(context, "/carlist"),
            ),
          ],
        ),
      ),
    );
  }
}
