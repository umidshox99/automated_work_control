import 'package:automated_work_control/data/services/navigator_service.dart';
import 'package:automated_work_control/data/services/storage_service.dart';
import 'package:automated_work_control/ui/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';

class SetUrlPage extends StatelessWidget {
  SetUrlPage({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();
  static const routeName = "/setUrlPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "ENTER URL",
                style: TextStyle(fontSize: 25),
              ),
            ),
            TextField(
              style: TextStyle(fontSize: 16, color: Colors.black),
              controller: controller,
              decoration: InputDecoration(
                hintText: "https://d0a2-82-215-100-162.ngrok.io",
              ),
            ),
            SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () {
                String url = controller.text.trim().toString().substring(8);
                StorageService.to.setURL(url);
                NavigatorService.to.pushReplacementNamed(LoginPage.routeName);
              },
              height: 55,
              minWidth: MediaQuery.of(context).size.width * 0.7,
              color: Colors.blueAccent,
              textColor: Colors.white,
              shape: StadiumBorder(),
              child: Text(
                "Run App",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
