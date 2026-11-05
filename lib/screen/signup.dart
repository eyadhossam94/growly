import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growly/screen/BottomNavigationBar.dart';
import 'package:growly/screen/login.dart';
import 'package:growly/screen/home.dart';
import 'package:growly/shareed.dart/TextField.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('كلمة السر غير متطابقة'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // تحديث اسم المستخدم في بروفايل Firebase
      await credential.user?.updateDisplayName(_nameController.text.trim());

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Bottomnavigationbar(),),
      );
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'email-already-in-use':
          message = 'الإيميل ده مستخدم قبل كده';
          break;
        case 'invalid-email':
          message = 'صيغة الإيميل غلط';
          break;
        case 'weak-password':
          message = 'كلمة السر ضعيفة، لازم 6 حروف على الأقل';
          break;
        default:
          message = 'حصل خطأ: ${e.message}';
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.redAccent),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حصل خطأ غير متوقع: $e')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.deepPurple, Colors.white],
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 300,
                    child: Image.asset("assets/Growlyassets/logo2.png"),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.archivoBlack(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ModernTextField(
                  label: 'Full Name',
                  prefixIcon: Icons.person_rounded,
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'الحقل مطلوب' : null,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ModernTextField(
                  label: 'Email',
                  prefixIcon: Icons.email_rounded,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'الحقل مطلوب' : null,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ModernTextField(
                  label: 'Password',
                  prefixIcon: Icons.lock_rounded,
                  isPassword: true,
                  controller: _passwordController,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'الحقل مطلوب' : null,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ModernTextField(
                  label: 'Confirm Password',
                  prefixIcon: Icons.lock_outline_rounded,
                  isPassword: true,
                  controller: _confirmPasswordController,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'الحقل مطلوب' : null,
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: _isLoading ? null : _signUp,
                child: Container(
                  height: 60,
                  width: 350,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : Text(
                          "Sign Up",
                          style: GoogleFonts.archivoBlack(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 245, 245, 247),
                          ),
                        ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("already have an account",),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: Text(
                      " Login",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}