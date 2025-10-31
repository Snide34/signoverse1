// lib/screens/translation_screen.dart (FINAL UI VERSION with Video Player)

import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../widgets/app_navigation_bar.dart';

// Enum to define the various states of the translation screen
enum TranslationState {
  input,          // Default state: User is typing/speaking
  textToSign,     // Showing text input, text output, and video output
  signToText      // Showing sign/speech input translated to text/speech output
}

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  // --- State Variables ---
  String _sourceLang = 'English';
  String _targetLang = 'Hindi';
  final List<String> _availableLanguages = ['English', 'Hindi', 'Bengali', 'Punjabi', 'Tamil', 'Telugu', 'Odia'];

  final TextEditingController _inputController = TextEditingController();

  // Controls the displayed UI
  TranslationState _currentState = TranslationState.input;

  // Data placeholders for demonstration
  final String _inputHistoryText = "Go straight and there's a good restaurant on the left.";
  final String _outputTranslatedText = "सीधे जाइए, और बाई ओर एक अच्छा रेस्टोरेंट है";

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  // --- Widget Builders ---

  // Builds the custom language dropdown button
  Widget _buildLanguageDropdown(String currentLang, Function(String) onChanged, {bool isSource = false}) {
    // ... (This function remains the same as the corrected version to avoid the assertion error) ...
    String getDisplayLabel(String value) {
      if (isSource) {
        return 'Sign Language\n($value)';
      }
      return value;
    }

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: currentLang,
            icon: const Icon(Icons.arrow_drop_down, color: AppColors.lightText),
            style: const TextStyle(color: AppColors.lightText, fontWeight: FontWeight.bold),
            dropdownColor: AppColors.primary,
            items: _availableLanguages.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(color: AppColors.lightText)),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                onChanged(newValue);
              }
            },
            selectedItemBuilder: (context) {
              return _availableLanguages.map((String value) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    getDisplayLabel(value),
                    style: const TextStyle(color: AppColors.lightText, fontWeight: FontWeight.bold, fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }

  // Card used for both Input (Text/Mic) and Output (Text/Speaker)
  Widget _buildContentCard({
    required Widget content,
    required Color color,
    required Alignment iconAlignment,
    required IconData icon,
    required VoidCallback onIconTap,
    required Color iconColor,
    required Color iconBackgroundColor,
    double? height,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          content,
          Align(
            alignment: iconAlignment,
            child: InkWell(
              onTap: onIconTap,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconBackgroundColor.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Main Content Builder based on State ---

  Widget _buildMainContent() {
    // Determine if we need the video player at the bottom
    final bool showVideo = _currentState == TranslationState.textToSign ||
        _currentState == TranslationState.signToText;

    return Column(
      children: [
        // 1. Translation Cards Area
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // --- Top Card: Input / Source Text ---
                _buildSourceCard(),
                const SizedBox(height: 16),

                // --- Language Selector Bar ---
                _buildLanguageBar(),
                const SizedBox(height: 16),

                // --- Middle Card: Output / Target Text ---
                _buildTargetCard(),

                // Add padding if video is NOT showing, so the last card isn't against the bottom edge
                if (!showVideo) const SizedBox(height: 20),
              ],
            ),
          ),
        ),

        // 2. Video Player Area (Only visible in T2S or S2T states)
        if (showVideo) _buildVideoPlayer(),
      ],
    );
  }

  Widget _buildSourceCard() {
    // If in the input state (initial), show the large text field
    if (_currentState == TranslationState.input) {
      return _buildContentCard(
        height: 200,
        color: AppColors.primary,
        iconAlignment: Alignment.bottomRight,
        icon: Icons.mic,
        iconColor: AppColors.primary,
        iconBackgroundColor: AppColors.secondary,
        onIconTap: () {
          // Simulate state change to output after input
          setState(() => _currentState = TranslationState.textToSign);
        },
        content: TextField(
          controller: _inputController,
          style: const TextStyle(color: AppColors.lightText, fontSize: 18),
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: 'Enter text',
            hintStyle: TextStyle(color: AppColors.lightText.withOpacity(0.7)),
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      );
    }

    // If in any output state, show the translated output text
    return _buildContentCard(
      height: 200,
      color: AppColors.primary,
      iconAlignment: Alignment.bottomRight,
      icon: Icons.mic, // Microphone for sign-to-text
      iconColor: AppColors.primary,
      iconBackgroundColor: AppColors.secondary,
      onIconTap: () {
        // Simulate re-recording/re-translating
        setState(() => _currentState = TranslationState.input);
      },
      content: Text(
        _outputTranslatedText, // The Hindi/Target language output
        style: const TextStyle(color: AppColors.lightText, fontSize: 18),
      ),
    );
  }

  Widget _buildTargetCard() {
    // If in input state, show the static 'Translation' placeholder text
    if (_currentState == TranslationState.input) {
      return _buildContentCard(
        height: 200,
        color: AppColors.secondary,
        iconAlignment: Alignment.bottomRight,
        icon: Icons.volume_up,
        iconColor: AppColors.lightText,
        iconBackgroundColor: AppColors.primary,
        onIconTap: () => print('Play audio for: Translation'),
        content: const Text(
          'Translation',
          style: TextStyle(color: AppColors.darkText, fontSize: 18),
        ),
      );
    }

    // If in any output state, show the source/user input text
    return _buildContentCard(
      height: 200,
      color: AppColors.secondary,
      iconAlignment: Alignment.bottomRight,
      icon: Icons.volume_up,
      iconColor: AppColors.lightText,
      iconBackgroundColor: AppColors.primary,
      onIconTap: () => print('Play audio for: $_inputHistoryText'),
      content: Text(
        _inputHistoryText, // The English/Source language text
        style: const TextStyle(color: AppColors.darkText, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLanguageBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.buttonShadow,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLanguageDropdown(
            _sourceLang,
                (newVal) => setState(() => _sourceLang = newVal),
            isSource: true,
          ),
          InkWell(
            onTap: () {
              setState(() {
                final temp = _sourceLang;
                _sourceLang = _targetLang;
                _targetLang = temp;
              });
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.compare_arrows, color: AppColors.primary, size: 28),
            ),
          ),
          _buildLanguageDropdown(
            _targetLang,
                (newVal) => setState(() => _targetLang = newVal),
            isSource: false,
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return Container(
      width: double.infinity,
      height: 250, // Height for the video player area
      padding: const EdgeInsets.all(16.0),
      // Background is the main background color of the screen (white/light)
      color: AppColors.background,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300, // Light grey background for the video box
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          // Video player placeholder
          child: Icon(
            Icons.play_circle_fill,
            size: 60,
            color: AppColors.primary, // Dark green play icon
          ),
        ),
      ),
    );
  }

  // --- Main Build Method ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Translation', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMainContent(), // Use the main content builder
          ),
          // --- Custom Bottom Navigation Bar ---
          AppNavigationBar(currentIndex: 1, onItemSelected: (int value) {  },),
        ],
      ),
    );
  }
}