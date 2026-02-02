import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Screen 16: Math Gate Dialog (Updated UI)
/// Purpose: Parent verification before accessing settings
/// Design: Clean modern look with circular keypad buttons
class MathGateDialog extends StatefulWidget {
  final VoidCallback onVerified;
  
  const MathGateDialog({
    super.key,
    required this.onVerified,
  });

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (ctx) => MathGateDialog(
        onVerified: () => Navigator.of(ctx).pop(true),
      ),
    );
    return result ?? false;
  }

  @override
  State<MathGateDialog> createState() => _MathGateDialogState();
}

class _MathGateDialogState extends State<MathGateDialog>
    with SingleTickerProviderStateMixin {
  // Colors matching the HTML design
  static const Color _darkTeal = Color(0xFF1B5E5E);
  static const Color _actionGreen = Color(0xFF7FBA96);
  static const Color _buttonGray = Color(0xFFF1F3F2);
  static const Color _hintAmber = Color(0xFFF59E0B);
  
  late int _num1;
  late int _num2;
  late int _correctAnswer;
  String _enteredAnswer = '';
  int _wrongAttempts = 0;
  bool _isLocked = false;
  int _lockSeconds = 30;
  bool _showCursor = true;
  
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _generateProblem();
    
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticIn),
    );
    
    // Blinking cursor
    _startCursorBlink();
  }

  void _startCursorBlink() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 530));
      if (!mounted) return false;
      setState(() => _showCursor = !_showCursor);
      return true;
    });
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _generateProblem() {
    final random = Random();
    _num1 = random.nextInt(5) + 1; // 1-5
    _num2 = random.nextInt(5) + 1; // 1-5
    _correctAnswer = _num1 + _num2;
    _enteredAnswer = '';
  }

  String _toBengaliNumeral(int number) {
    const bengaliDigits = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    if (number < 10) return bengaliDigits[number];
    return number.toString().split('').map((d) => bengaliDigits[int.parse(d)]).join();
  }

  void _onNumberPressed(int number) {
    if (_isLocked || _enteredAnswer.length >= 2) return;
    HapticFeedback.lightImpact();
    setState(() {
      _enteredAnswer += number.toString();
    });
  }

  void _onDelete() {
    if (_isLocked || _enteredAnswer.isEmpty) return;
    HapticFeedback.lightImpact();
    setState(() {
      _enteredAnswer = _enteredAnswer.substring(0, _enteredAnswer.length - 1);
    });
  }

  void _onSubmit() {
    if (_isLocked || _enteredAnswer.isEmpty) return;
    
    final entered = int.tryParse(_enteredAnswer) ?? -1;
    
    if (entered == _correctAnswer) {
      HapticFeedback.mediumImpact();
      widget.onVerified();
    } else {
      HapticFeedback.heavyImpact();
      _shakeController.forward(from: 0);
      
      setState(() {
        _wrongAttempts++;
        _enteredAnswer = '';
        
        if (_wrongAttempts >= 3) {
          _isLocked = true;
          _startLockTimer();
        }
      });
    }
  }

  void _startLockTimer() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (!mounted) return false;
      
      setState(() {
        _lockSeconds--;
      });
      
      if (_lockSeconds <= 0) {
        setState(() {
          _isLocked = false;
          _wrongAttempts = 0;
          _lockSeconds = 30;
          _generateProblem();
        });
        return false;
      }
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Responsive sizing based on screen height
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenHeight < 700;
    
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: isSmallScreen ? 20.h : 40.h,
      ),
      child: AnimatedBuilder(
        animation: _shakeAnimation,
        builder: (context, child) {
          final shake = sin(_shakeAnimation.value * pi * 4) * 10;
          return Transform.translate(
            offset: Offset(shake, 0),
            child: child,
          );
        },
        child: Container(
          width: min(320.w, MediaQuery.of(context).size.width - 48),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: isSmallScreen ? 16.h : 20.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 32,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: _isLocked ? _buildLockedContent() : _buildGateContent(isSmallScreen),
        ),
      ),
    );
  }

  Widget _buildLockedContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.lock_rounded,
          size: 64.sp,
          color: const Color(0xFFC75146),
        ),
        SizedBox(height: 16.h),
        Text(
          '${_toBengaliNumeral(_lockSeconds)} সেকেন্ড অপেক্ষা করুন',
          style: TextStyle(
            fontFamily: 'NotoSansBengali',
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: _darkTeal,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Wait $_lockSeconds seconds',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[500],
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          '00:${_lockSeconds.toString().padLeft(2, '0')}',
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFC75146),
          ),
        ),
      ],
    );
  }

  Widget _buildGateContent([bool isSmallScreen = false]) {
    final buttonSize = isSmallScreen ? 52.w : 58.w;
    final fontSize = isSmallScreen ? 20.sp : 24.sp;
    final mathFontSize = isSmallScreen ? 30.sp : 34.sp;
    final spacing = isSmallScreen ? 8.h : 12.h;
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header with lock icon
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_rounded,
              size: isSmallScreen ? 20.sp : 22.sp,
              color: _darkTeal,
            ),
            SizedBox(width: 6.w),
            Text(
              'পিতা-মাতার এলাকা',
              style: TextStyle(
                fontFamily: 'NotoSansBengali',
                fontSize: isSmallScreen ? 16.sp : 17.sp,
                fontWeight: FontWeight.bold,
                color: _darkTeal,
              ),
            ),
          ],
        ),
        
        SizedBox(height: isSmallScreen ? 16.h : 20.h),
        
        // Math problem - large Bengali numerals
        Text(
          '${_toBengaliNumeral(_num1)} + ${_toBengaliNumeral(_num2)} = ?',
          style: TextStyle(
            fontFamily: 'NotoSansBengali',
            fontSize: mathFontSize,
            fontWeight: FontWeight.bold,
            color: _darkTeal,
            letterSpacing: 2,
          ),
        ),
        
        SizedBox(height: isSmallScreen ? 14.h : 18.h),
        
        // Answer box with blinking cursor
        Container(
          width: isSmallScreen ? 110.w : 130.w,
          height: isSmallScreen ? 46.h : 52.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: _darkTeal,
              width: 2,
            ),
          ),
          child: Center(
            child: _enteredAnswer.isEmpty
                ? AnimatedOpacity(
                    opacity: _showCursor ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 100),
                    child: Text(
                      '|',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: _darkTeal,
                      ),
                    ),
                  )
                : Text(
                    _toBengaliNumeral(int.parse(_enteredAnswer)),
                    style: TextStyle(
                      fontFamily: 'NotoSansBengali',
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: _darkTeal,
                    ),
                  ),
          ),
        ),
        
        SizedBox(height: 6.h),
        
        // Hint text
        Text(
          'আঙুলে গুনে দেখুন!',
          style: TextStyle(
            fontFamily: 'NotoSansBengali',
            fontSize: isSmallScreen ? 12.sp : 13.sp,
            fontWeight: FontWeight.w500,
            color: _hintAmber,
          ),
        ),
        
        SizedBox(height: isSmallScreen ? 14.h : 18.h),
        
        // Numeric keypad - circular buttons
        _buildNumberPad(buttonSize, fontSize, spacing),
        
        SizedBox(height: isSmallScreen ? 8.h : 12.h),
        
        // Cancel button
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'বাতিল',
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: isSmallScreen ? 14.sp : 15.sp,
              fontWeight: FontWeight.w500,
              color: _darkTeal,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNumberPad([double? buttonSize, double? fontSize, double? spacing]) {
    final size = buttonSize ?? 58.w;
    final font = fontSize ?? 24.sp;
    final gap = spacing ?? 12.h;
    
    return SizedBox(
      width: size * 3 + 32.w, // 3 buttons + spacing
      child: Column(
        children: [
          // Row 1: 1, 2, 3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCircularNumberButton(1, size, font),
              _buildCircularNumberButton(2, size, font),
              _buildCircularNumberButton(3, size, font),
            ],
          ),
          SizedBox(height: gap),
          // Row 2: 4, 5, 6
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCircularNumberButton(4, size, font),
              _buildCircularNumberButton(5, size, font),
              _buildCircularNumberButton(6, size, font),
            ],
          ),
          SizedBox(height: gap),
          // Row 3: 7, 8, 9
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCircularNumberButton(7, size, font),
              _buildCircularNumberButton(8, size, font),
              _buildCircularNumberButton(9, size, font),
            ],
          ),
          SizedBox(height: gap),
          // Row 4: Backspace, 0, Submit
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCircularActionButton(
                icon: Icons.backspace_outlined,
                color: Colors.transparent,
                iconColor: const Color(0xFF9CA3AF),
                onTap: _onDelete,
                size: size,
              ),
              _buildCircularNumberButton(0, size, font),
              _buildCircularActionButton(
                icon: Icons.check_rounded,
                color: _actionGreen,
                iconColor: Colors.white,
                onTap: _onSubmit,
                hasShadow: true,
                size: size,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularNumberButton(int number, [double? size, double? fontSize]) {
    final btnSize = size ?? 58.w;
    final font = fontSize ?? 24.sp;
    
    return GestureDetector(
      onTap: () => _onNumberPressed(number),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: btnSize,
        height: btnSize,
        decoration: BoxDecoration(
          color: _buttonGray,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            _toBengaliNumeral(number),
            style: TextStyle(
              fontFamily: 'NotoSansBengali',
              fontSize: font,
              fontWeight: FontWeight.bold,
              color: _darkTeal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircularActionButton({
    required IconData icon,
    required Color color,
    required Color iconColor,
    required VoidCallback onTap,
    bool hasShadow = false,
    double? size,
  }) {
    final btnSize = size ?? 58.w;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnSize,
        height: btnSize,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: _actionGreen.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Icon(
            icon,
            size: btnSize * 0.45,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
