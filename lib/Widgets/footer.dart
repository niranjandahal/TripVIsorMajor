import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign up for our newsletter',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Get the latest updates and offers directly to your inbox.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: ElevatedButton(
                      onPressed: () {
                        // Handle subscription logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                      ),
                      child: Text(
                        'Subscribe',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              FooterLink('About Us'),
              FooterLink('Contact Us'),
              FooterLink('Terms of Service'),
              FooterLink('Privacy Policy'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialLink('https://example.com/social1',
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Facebook_icon.svg/1200px-Facebook_icon.svg.png'),
              const SizedBox(width: 30),
              SocialLink('https://example.com/social2',
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/1200px-Instagram_icon.png'),
              const SizedBox(width: 30),
              SocialLink('https://example.com/social3',
                  'https://cdn-icons-png.flaticon.com/256/1384/1384060.png'),
              const SizedBox(width: 30),
              SocialLink('https://example.com/social4',
                  'https://cdn-icons-png.flaticon.com/512/3670/3670157.png'),
              const SizedBox(width: 30),
            ],
          ),
          SizedBox(height: 20),
          Image.asset(
            'asset/images/icon.png',
            width: 70,
            height: 70,
          ),
          //copyright
          SizedBox(height: 20),
          Text(
            '© 2024 TripVisor. All rights reserved.',
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}

class FooterLink extends StatelessWidget {
  final String label;

  FooterLink(this.label);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Handle link tap
      },
      child: Text(
        label,
        style: TextStyle(
          color: Colors.blue[700],
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class SocialLink extends StatelessWidget {
  final String url;
  final String iconPath;

  SocialLink(this.url, this.iconPath);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle social link tap
      },
      child: Image.network(
        iconPath,
        width: 50,
        height: 50,
      ),
    );
  }
}
