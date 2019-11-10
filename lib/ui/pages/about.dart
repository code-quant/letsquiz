import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("About",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
              Container(
                color: Colors.blue,
                height: 4,
                width: 30,
              ),
              SizedBox(
                height: 50,
              ),

              //Ankit Rawat Info
              _buildDevInfo("Ankit Rawat", "Haridwar", "CS Student"),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Text(
                    "Tech enthusiast, I love code & coffee. I designed & coded UI elements of this project."),
              ),
              _buildSocialsRow(
                  "https://facebook.com",
                  "https://instagram.com/insanitywanted",
                  "https://github.com/codequant"),
              Divider(
                color: Colors.black12,
              ),
              SizedBox(height: 20.0),

              //Deepanshu Singh Info
              _buildDevInfo("Deepanshu Singh", "Haldwani", "CS Student"),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Text(
                    "I love competitive programming & anime. I helped in coding the logic behind this project."),
              ),
              _buildSocialsRow(
                  "https://facebook.com/iamankitrawat",
                  "https://instagram.com/insanitywanted",
                  "https://github.com/codequant"),
              Divider(
                color: Colors.black12,
              ),
              SizedBox(height: 20.0),

              //Shiva Thakur Info
              _buildDevInfo("Shiva Thakur", "Dehradun", "CS Student"),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: Text(
                    "Keen observer, I love traveling. I helped with logic and API."),
              ),
              _buildSocialsRow(
                  "https://facebook.com/iamankitrawat",
                  "https://instagram.com/insanitywanted",
                  "https://github.com/codequant"),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  //Social Links
  Row _buildSocialsRow(String facebook, String instagram, String github) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 10.0),
        IconButton(
          color: Colors.indigo,
          icon: Icon(FontAwesomeIcons.facebookF),
          onPressed: () {
            _launchURL(facebook);
          },
        ),
        SizedBox(width: 5.0),
        IconButton(
          color: Colors.pink,
          icon: Icon(FontAwesomeIcons.instagram),
          onPressed: () {
            _launchURL(instagram);
          },
        ),
        SizedBox(width: 5.0),
        IconButton(
          color: Colors.indigo,
          icon: Icon(FontAwesomeIcons.github),
          onPressed: () {
            _launchURL(github);
          },
        ),
        SizedBox(width: 10.0),
      ],
    );
  }

  //Method to launch URLs
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //Developer Details Section
  Row _buildDevInfo(String name, String location, String designation) {
    return Row(
      children: <Widget>[
        SizedBox(width: 20.0),
        Container(
          width: 80.0,
          height: 80.0,
          child: CircleAvatar(
            radius: 40,
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage('assets/images/$name.jpg'),
            ),
          ),
        ),
        SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(designation),
            SizedBox(height: 5.0),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.mapMarkerAlt,
                  size: 12.0,
                  color: Colors.black54,
                ),
                SizedBox(width: 10.0),
                Text(
                  location,
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
