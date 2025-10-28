// lib/models/onboarding_content.dart

class OnboardingContent {
  final String imagePath;
  final String title;
  final String description;

  OnboardingContent({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

// Define the data for your three screens
final List<OnboardingContent> onboardingData = [
  OnboardingContent(
    imagePath: 'assets/images/onboarding1.png', // Save your 1st image here
    title: 'Welcome to Sign-o-Verse',
    description:
    'Experience effortless communication as your gestures turn into text and speech in real time. Learn new signs, explore languages, and connect with anyone — your hands become your voice and your classroom, anytime, anywhere.',
  ),
  OnboardingContent(
    imagePath: 'assets/images/onboarding2.png', // Save your 2nd image here
    title: 'Experience real-time two-way communication',
    description:
    'Turn your gestures into text and speech, and convert spoken words into signs — bridging communication between everyone, effortlessly.',
  ),
  OnboardingContent(
    imagePath: 'assets/images/onboarding3.png', // Save your 3rd image here
    title: 'Your Classroom for Sign and Spoken Languages',
    description:
    'Learn sign language or any spoken language through interactive lessons, visual guides, and live tutors. Empower yourself and others through communication.',
  ),
];