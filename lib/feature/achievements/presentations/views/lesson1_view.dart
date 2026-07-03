import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kids_education_learning/feature/achievements/presentations/views/widgets/gradient_progress_bar.dart';


class Lesson1View extends StatefulWidget {
  final int totalSteps;
  final int currentStep;
  final int accumulatedScore;
  final int accumulatedTotal;
  final void Function(int score)? onFinished;
  final void Function(int score, int total)? onProgress;

  const Lesson1View({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.accumulatedScore = 0,
    this.accumulatedTotal = 0,
    this.onFinished,
    this.onProgress,
  });

  static const String routeName = 'achievements';

  @override
  State<Lesson1View> createState() => _Lesson1ViewState();
}

class _Lesson1ViewState extends State<Lesson1View>
    with SingleTickerProviderStateMixin {

  FlutterTts? _tts;
  bool _isSpeaking = false;
  bool _ttsReady   = false;

  static const List<_Question> _questions = [
    _Question(soundWord: 'I', choices: [
      _Choice(imagePath: 'assets/images/a.png', value: 'A'),
      _Choice(imagePath: 'assets/images/i.png', value: 'I'),
      _Choice(imagePath: 'assets/images/e.png', value: 'E'),
    ], correctIndex: 1),
    _Question(soundWord: 'A', choices: [
      _Choice(imagePath: 'assets/images/a.png', value: 'A'),
      _Choice(imagePath: 'assets/images/i.png', value: 'I'),
      _Choice(imagePath: 'assets/images/e.png', value: 'E'),
    ], correctIndex: 0),
    _Question(soundWord: 'E', choices: [
      _Choice(imagePath: 'assets/images/a.png', value: 'A'),
      _Choice(imagePath: 'assets/images/i.png', value: 'I'),
      _Choice(imagePath: 'assets/images/e.png', value: 'E'),
    ], correctIndex: 2),
  ];

  int _currentIndex = 0;
  int _score        = 0;
  int? _selectedChoice;
  bool? _lastResult;

  late final AnimationController _shakeCtrl;
  _Question get _current => _questions[_currentIndex];

  @override
  void initState() {
    super.initState();
    _shakeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _initTts();
  }

  @override
  void dispose() {
    _tts?.stop();
    _shakeCtrl.dispose();
    super.dispose();
  }

  Future<void> _initTts() async {
    try {
      final tts = FlutterTts();
      await tts.setLanguage('en-US');
      await tts.setSpeechRate(0.4);
      await tts.setPitch(1.2);
      await tts.setVolume(1.0);
      tts.setStartHandler(()      { if (mounted) setState(() => _isSpeaking = true); });
      tts.setCompletionHandler(() { if (mounted) setState(() => _isSpeaking = false); });
      tts.setCancelHandler(()    { if (mounted) setState(() => _isSpeaking = false); });
      tts.setErrorHandler((_)   { if (mounted) setState(() => _isSpeaking = false); });
      _tts = tts;
      if (mounted) setState(() => _ttsReady = true);
      await Future.delayed(const Duration(milliseconds: 500));
      _playSound();
    } catch (e) {
      debugPrint('TTS init: $e');
    }
  }

  Future<void> _playSound() async {
    if (_tts == null || !_ttsReady) return;
    if (_isSpeaking) await _tts!.stop();
    await _tts!.speak(_current.soundWord);
  }

  void _onChoiceTap(int i) {
    if (_selectedChoice != null) return;
    final correct = i == _current.correctIndex;
    setState(() {
      _selectedChoice = i;
      _lastResult = correct;
      if (correct) {
        _score++;
        widget.onProgress?.call(_score, _questions.length);
      }
    });
    if (!correct) _shakeCtrl.forward(from: 0);
    Future.delayed(const Duration(milliseconds: 900), _advance);
  }

  void _advance() {
    if (!mounted) return;
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedChoice = null;
        _lastResult     = null;
      });
      _playSound();
    } else {
      widget.onFinished?.call(_score);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hear the sound and\nmatch it to the letter",
                    style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold,
                      color: Color(0xFF000846),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () => widget.onFinished?.call(_score),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                    child: const Text("Skip"),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "Select the shapes that match the word.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              GradientProgressBar(
                totalSteps: widget.totalSteps,
                currentStep: widget.currentStep,
                stepScore: _score,
                stepTotal: _questions.length,
              ),
              const SizedBox(height: 60),
              Center(
                child: GestureDetector(
                  onTap: _playSound,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 90, height: 90,
                    decoration: BoxDecoration(
                      color: _isSpeaking ? const Color(0xFFEEF0FB) : Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: _isSpeaking ? const Color(0xFF5C6BC0) : Colors.grey.shade200,
                        width: _isSpeaking ? 2 : 1,
                      ),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10, offset: const Offset(0, 4))],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        'assets/images/sound.png',
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => Icon(
                          _isSpeaking ? Icons.volume_up : Icons.volume_up_outlined,
                          color: const Color(0xFF3949AB), size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(_current.choices.length, _buildCard),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(int i) {
    final choice    = _current.choices[i];
    final isSelected = _selectedChoice == i;
    final isCorrect  = i == _current.correctIndex;

    Color borderColor = Colors.grey.shade200;
    Color bgColor     = Colors.white;
    Widget? badge;

    if (_selectedChoice != null) {
      if (isCorrect) {
        borderColor = Colors.green;
        bgColor     = Colors.green.shade50;
        badge = const Icon(Icons.check_circle, color: Colors.green, size: 22);
      } else if (isSelected) {
        borderColor = Colors.red;
        bgColor     = Colors.red.shade50;
        badge = const Icon(Icons.cancel, color: Colors.red, size: 22);
      }
    }

    Widget card = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 90, height: 120,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(choice.imagePath, fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Text(choice.value,
                  style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w600, color: Color(0xFF000846)))),
            ),
          ),
          if (badge != null) Positioned(top: 8, right: 8, child: badge),
        ],
      ),
    );

    if (isSelected && _lastResult == false) {
      card = AnimatedBuilder(
        animation: _shakeCtrl,
        builder: (_, child) {
          final dx = (_shakeCtrl.value < 0.5 ? _shakeCtrl.value : 1 - _shakeCtrl.value) * 14;
          return Transform.translate(offset: Offset(dx, 0), child: child);
        },
        child: card,
      );
    }

    return GestureDetector(onTap: () => _onChoiceTap(i), child: card);
  }
}

class _Choice {
  final String imagePath;
  final String value;
  const _Choice({required this.imagePath, required this.value});
}

class _Question {
  final String soundWord;
  final List<_Choice> choices;
  final int correctIndex;
  const _Question({required this.soundWord, required this.choices, required this.correctIndex});
}
