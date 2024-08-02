import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class ContactSection extends StatefulWidget {
  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final HttpsCallable _sendContactEmail = FirebaseFunctions.instance.httpsCallable('sendContactEmail');

  Future<void> _submitForm() async {
    try {
      final response = await _sendContactEmail.call({
        'name': _nameController.text,
        'email': _emailController.text,
        'message': _messageController.text,
      });

      if (response.data['success']) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email sent successfully!')));
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to send email.')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      color: Color(0xFF212A31),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Connect with me',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5AB9EA),
                ),
              ),
              SizedBox(height: 20),
              isLargeScreen
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildContactForm(),
                        SizedBox(width: 50),
                        _buildContactDetails(),
                      ],
                    )
                  : Column(
                      children: [
                        _buildContactForm(),
                        SizedBox(height: 50),
                        _buildContactDetails(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      width: 400,
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _emailController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _messageController,
            maxLines: 4,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Message',
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Send'),
          ),
        ],
      ),
    );
  }

  Widget _buildContactDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.email, color: Colors.white),
            SelectableText(
              ' vihaantejavath@gmail.com',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(Icons.phone, color: Colors.white),
            SizedBox(width: 10),
            SelectableText(
              '+91 9618516787',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Icon(Icons.location_on, color: Colors.white),
            SizedBox(width: 10),
            SelectableText(
              'Hyderabad, Telangana IN',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
