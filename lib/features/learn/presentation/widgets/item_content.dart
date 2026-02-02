import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../models/category_item.dart';
import 'sound_button.dart';
import 'spelling_section.dart';
import 'fun_fact_card.dart';

/// Main content widget for each item in the PageView
class ItemContent extends StatelessWidget {
  final CategoryItem item;
  final Color accentColor;
  final VoidCallback onPlaySound;

  const ItemContent({
    super.key,
    required this.item,
    required this.accentColor,
    required this.onPlaySound,
  });

  // Generate spelling breakdown
  List<String> _getSpellingParts(String word) {
    // Simple breakdown - in real app this would be more sophisticated
    if (word.length <= 1) return [word];
    if (word.length == 2) return [word[0], word[1]];
    // For longer words, split roughly in half
    final mid = word.length ~/ 2;
    return [word.substring(0, mid), word.substring(mid)];
  }

  String _getFunFact(String word) {
    // Sample fun facts - in real app this would come from data
    final facts = {
      'গরু': 'গরু আমাদের দুধ দেয়।',
      'বিড়াল': 'বিড়াল "মিউ মিউ" করে ডাকে।',
      'কুকুর': 'কুকুর আমাদের বিশ্বস্ত বন্ধু।',
      'ছাগল': 'ছাগল পাহাড়ে চড়তে পারে।',
      'হাতি': 'হাতি সবচেয়ে বড় স্থলচর প্রাণী।',
      'বাঘ': 'বাঘ আমাদের জাতীয় পশু।',
      'সিংহ': 'সিংহকে বনের রাজা বলা হয়।',
      'বানর': 'বানর গাছে লাফাতে পছন্দ করে।',
      'ঘোড়া': 'ঘোড়া খুব দ্রুত দৌড়াতে পারে।',
      'পাখি': 'পাখি আকাশে উড়ে বেড়ায়।',
      'মাছ': 'মাছ পানিতে বাস করে।',
      'হাঁস': 'হাঁস পানিতে সাঁতার কাটে।',
    };
    return facts[word] ?? 'এটি একটি সুন্দর জিনিস!';
  }

  @override
  Widget build(BuildContext context) {
    final spellingParts = _getSpellingParts(item.nameBn);
    
    // Gradient colors based on accent
    final gradientStart = accentColor.withOpacity(0.15);
    final gradientEnd = accentColor.withOpacity(0.25);

    return Column(
      children: [
        // Hero section with image
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [gradientStart, gradientEnd],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(48.r),
              bottomRight: Radius.circular(48.r),
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: _buildImage(),
              ),
            ),
          ),
        ),

        // Content section
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: 120.h),
            child: Column(
              children: [
                SizedBox(height: 24.h),

                // Sound button
                SoundButton(onTap: onPlaySound),

                SizedBox(height: 16.h),

                // Large Bengali word
                Text(
                  item.nameBn,
                  style: TextStyle(
                    fontSize: 72.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                    height: 1.1,
                  ),
                ),

                SizedBox(height: 24.h),

                // Spelling breakdown
                SpellingSection(
                  parts: spellingParts,
                  fullWord: item.nameBn,
                  accentColor: accentColor,
                ),

                SizedBox(height: 32.h),

                // Fun fact card
                FunFactCard(
                  fact: _getFunFact(item.nameBn),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    if (item.imageUrl != null && item.imageUrl!.isNotEmpty) {
      return Image.network(
        item.imageUrl!,
        width: 200.w,
        height: 200.w,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => _buildEmoji(),
      );
    }
    return _buildEmoji();
  }

  Widget _buildEmoji() {
    return Text(
      item.emoji,
      style: TextStyle(fontSize: 140.sp),
    );
  }
}
