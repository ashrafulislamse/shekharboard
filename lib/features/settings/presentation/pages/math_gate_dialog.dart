import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';

/// Screen 16: Math Gate Dialog (Custom Number Pad)
/// Purpose: Verify adult access without soft keyboard issues
/// Design: Bilingual (Bengali + English) for parents
class MathGateDialog extends StatefulWidget {
  final VoidCallback onSuccess;

  const MathGateDialog({
    super.key,
    required this.onSuccess,
  });

  /// Show the math gate dialog
  static Future<bool> show(BuildContext context) async {
    bool success = false;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => MathGateDialog(
        onSuccess: () {
          success = true;
        },
      ),
    );
    return success;
  }

  @override
  State<MathGateDialog> createState() => _MathGateDialogState();
}

class _MathGateDialogState extends State<MathGateDialog>
    with SingleTickerProviderStateMixin {
  late int _num1;
  late int _num2;
  String _answer = '';
  int _wrongAttempts = 0;
  bool _isLocked = false;
  int _lockSecondsRemaining = 0;
  Timer? _lockTimer;
  
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _generateNewQuestion();
    
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    
    _shakeAnimation = Tween<double>(begin: 0, end: 10)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_shakeController);
  }

  void _generateNewQuestion() {
    final random = Random();
    _num1 = random.nextInt(5) + 1; // 1-5
    _num2 = random.nextInt(5) + 1; // 1-5
  }

  String _toBengaliNumber(int number) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    return number.toString().split('').map((d) => bengaliDigits[int.parse(d)]).join();
  }

  void _onNumberPressed(String number) {
    if (_answer.length < 2 && !_isLocked) {
      HapticFeedback.lightImpact();
      setState(() => _answer += number);
    }
  }

  void _onDelete() {
    if (_answer.isNotEmpty && !_isLocked) {
      HapticFeedback.lightImpact();
      setState(() => _answer = _answer.substring(0, _answer.length - 1));
    }
  }

  void _checkAnswer() {
    if (_answer.isEmpty || _isLocked) return;
    
    final correctAnswer = _num1 + _num2;

    if (int.tryParse(_answer) == correctAnswer) {
      HapticFeedback.mediumImpact();
      widget.onSuccess();
      Navigator.pop(context);
    } else {
      _wrongAttempts++;
      _answer = '';
      
      // Shake animation
      HapticFeedback.heavyImpact();
      _shakeController.forward().then((_) => _shakeController.reset());

      if (_wrongAttempts >= 3) {
        _startLockTimer();
      }

      setState(() {});
    }
  }

  void _startLockTimer() {
    _isLocked = true;
    _lockSecondsRemaining = 30;

    _lockTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _lockSecondsRemaining--;
        if (_lockSecondsRemaining <= 0) {
          _isLocked = false;
          _wrongAttempts = 0;
          _generateNewQuestion();
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _lockTimer?.cancel();
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Container(
        width: 280.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20.r,
              offset: Offset(0, 8.h),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with close button
            _buildHeader(),
            
            // Content
            _isLocked ? _buildLockedState() : _buildQuestionState(),
            
            // Number Pad (compact)
            if (!_isLocked) _buildNumberPad(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 8.w, 0),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: AppColors.accentGreen.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.lock_outline,
              color: AppColors.accentGreen,
              size: 20.w,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'অভিভাবক যাচাই',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkTeal,
                  ),
                ),
                Text(
                  'Parent Verification',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close, color: Colors.grey[400], size: 20.w),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(minWidth: 32.w, minHeight: 32.w),
          ),
        ],
      ),
    );
  }

  Widget _buildLockedState() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: [
          Icon(Icons.timer, size: 48.w, color: Colors.red[400]),
          SizedBox(height: 12.h),
          Text(
            '${_toBengaliNumber(_lockSecondsRemaining)}s',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: Colors.red[600],
            ),
          ),
          Text(
            'অপেক্ষা করুন / Please wait',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 12.sp,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionState() {
    return AnimatedBuilder(
      animation: _shakeAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_shakeAnimation.value, 0),
          child: child,
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            // Math Question - Compact
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8F0),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _toBengaliNumber(_num1),
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkTeal,
                    ),
                  ),
                  Text(
                    ' + ',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accentGreen,
                    ),
                  ),
                  Text(
                    _toBengaliNumber(_num2),
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkTeal,
                    ),
                  ),
                  Text(
                    ' = ',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  // Answer Box
                  Container(
                    width: 44.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.accentGreen, width: 2),
                    ),
                    child: Center(
                      child: _answer.isEmpty
                          ? Container(width: 2.w, height: 18.h, color: AppColors.accentGreen)
                          : Text(
                              _answer,
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkTeal,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Hint after wrong attempts
            if (_wrongAttempts >= 2)
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  '💡 আঙুলে গুনে দেখুন!',
                  style: TextStyle(
                    fontFamily: 'NotoSansBengali',
                    fontSize: 11.sp,
                    color: Colors.orange[600],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberPad() {
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 12.h),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          // Row 1-2-3
          _buildNumberRow(['১', '২', '৩'], ['1', '2', '3']),
          SizedBox(height: 6.h),
          // Row 4-5-6
          _buildNumberRow(['৪', '৫', '৬'], ['4', '5', '6']),
          SizedBox(height: 6.h),
          // Row 7-8-9
          _buildNumberRow(['৭', '৮', '৯'], ['7', '8', '9']),
          SizedBox(height: 6.h),
          // Row: Del-0-OK
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildActionButton(
                icon: Icons.backspace_outlined,
                onTap: _onDelete,
              ),
              SizedBox(width: 6.w),
              _buildNumberButton('০', '0'),
              SizedBox(width: 6.w),
              _buildActionButton(
                icon: Icons.check,
                onTap: _checkAnswer,
                isPrimary: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumberRow(List<String> bengaliNumbers, List<String> values) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: _buildNumberButton(bengaliNumbers[index], values[index]),
        );
      }),
    );
  }

  Widget _buildNumberButton(String bengaliNum, String value) {
    return GestureDetector(
      onTap: () => _onNumberPressed(value),
      child: Container(
        width: 52.w,
        height: 44.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.grey[200]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Center(
          child: Text(
            bengaliNum,
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.darkTeal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onTap,
    bool isPrimary = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52.w,
        height: 44.h,
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.accentGreen : Colors.grey[200],
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: isPrimary
              ? [
                  BoxShadow(
                    color: AppColors.accentGreen.withOpacity(0.3),
                    blurRadius: 4.r,
                    offset: Offset(0, 2.h),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Icon(
            icon,
            size: 20.w,
            color: isPrimary ? Colors.white : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
