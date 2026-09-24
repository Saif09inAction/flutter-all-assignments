import 'package:flutter/material.dart';

void main() {
  runApp(const RegistrationApp());
}

class RegistrationApp extends StatelessWidget {
  const RegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),

      // Named routes
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/form': (context) => const RegistrationFormScreen(),
        '/detail': (context) => const DetailScreen(),
      },
    );
  }
}

// --------------------------------------------------
// HOME SCREEN
// --------------------------------------------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration App'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.app_registration,
                size: 90,
                color: Colors.deepPurple,
              ),

              const SizedBox(height: 20),

              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Register yourself to continue.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/form');
                },
                child: const Text('Register Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --------------------------------------------------
// REGISTRATION FORM SCREEN
// --------------------------------------------------

class RegistrationFormScreen extends StatefulWidget {
  const RegistrationFormScreen({super.key});

  @override
  State<RegistrationFormScreen> createState() =>
      _RegistrationFormScreenState();
}

class _RegistrationFormScreenState
    extends State<RegistrationFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController phoneController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Email validation
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailPattern =
        RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

    if (!emailPattern.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  // Password validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        '/detail',
        arguments: {
          'name': nameController.text.trim(),
          'phone': phoneController.text.trim(),
          'email': emailController.text.trim(),
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Create Your Account',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Please enter your details below.',
                style: TextStyle(fontSize: 15),
              ),

              const SizedBox(height: 25),

              // Name
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Phone
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Phone number is required';
                  }

                  if (value.trim().length < 10) {
                    return 'Enter a valid phone number';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Email
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: validateEmail,
              ),

              const SizedBox(height: 16),

              // Password
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: validatePassword,
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'Submit Registration',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --------------------------------------------------
// DETAIL SCREEN
// --------------------------------------------------

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments
            as Map<String, String>;

    final name = arguments['name'] ?? '';
    final phone = arguments['phone'] ?? '';
    final email = arguments['email'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.check_circle,
                size: 80,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                'Registration Successful!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: $name',
                      style: const TextStyle(fontSize: 18),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      'Phone: $phone',
                      style: const TextStyle(fontSize: 18),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      'Email: $email',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    ModalRoute.withName('/'),
                  );
                },
                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}