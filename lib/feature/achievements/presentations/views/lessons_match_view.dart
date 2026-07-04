import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/achievements/presentations/views/widgets/gradient_progress_bar.dart';

class MatchQuestion {
  final List<String> imagePaths;
  final int count;
  const MatchQuestion({required this.imagePaths, required this.count});
}

class MatchOption {
  final String imagePath;
  final int value;
  const MatchOption({required this.imagePath, required this.value});
}

class LessonsMatchView extends StatefulWidget {
  final int totalSteps;
  final int currentStep;
  final void Function(int score)? onFinished;
  final void Function(int score, int total)? onProgress;

  const LessonsMatchView({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.onFinished,
    this.onProgress,
  });
  static const String routeName = 'LessonsMatchView';

  @override
  State<LessonsMatchView> createState() => _LessonsMatchViewState();
}

class _LessonsMatchViewState extends State<LessonsMatchView>
    with TickerProviderStateMixin {

  final List<MatchQuestion> _questions = const [
    MatchQuestion(
      imagePaths: ['assets/images/jellyfish.png','assets/images/jellyfish.png','assets/images/jellyfish.png'],
      count: 3,
    ),
    MatchQuestion(
      imagePaths: ['assets/images/whale.png','assets/images/whale.png'],
      count: 2,
    ),
    MatchQuestion(
      imagePaths: ['assets/images/fish.png','assets/images/fish.png','assets/images/fish.png','assets/images/fish.png','assets/images/fish.png'],
      count: 5,
    ),
  ];

  final List<MatchOption> _options = const [
    MatchOption(imagePath: 'assets/images/2.png', value: 2),
    MatchOption(imagePath: 'assets/images/5.png', value: 5),
    MatchOption(imagePath: 'assets/images/3.png', value: 3),
  ];

  int? _selectedQuestion;
  final Map<int, bool?> _questionResults = {};
  final Map<int, bool?> _optionResults   = {};
  int _score = 0;
  final Map<int, AnimationController> _shakeControllers = {};

  bool get _allAnswered =>
      _questionResults.length == _questions.length &&
      _questionResults.values.every((v) => v == true);

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _options.length; i++) {
      _shakeControllers[i] = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
      );
    }
  }

  @override
  void dispose() {
    for (final c in _shakeControllers.values) c.dispose();
    super.dispose();
  }

  void _onQuestionTap(int qIndex) {
    if (_questionResults[qIndex] == true) return;
    setState(() {
      _selectedQuestion = (_selectedQuestion == qIndex) ? null : qIndex;
    });
  }

  void _onOptionTap(int oIndex) {
    if (_selectedQuestion == null) return;
    if (_optionResults[oIndex] == true) return;

    final qIndex  = _selectedQuestion!;
    final correct = _questions[qIndex].count == _options[oIndex].value;

    setState(() {
      if (correct) {
        _questionResults[qIndex] = true;
        _optionResults[oIndex]   = true;
        _score++;
        _selectedQuestion = null;
        widget.onProgress?.call(_score, _questions.length);

        if (_allAnswered) {
          Future.delayed(
            const Duration(milliseconds: 600),
            () => widget.onFinished?.call(_score),
          );
        }
      } else {
        _questionResults[qIndex] = false;
        _optionResults[oIndex]   = false;
        _shakeControllers[oIndex]?.forward(from: 0);

        Future.delayed(const Duration(milliseconds: 700), () {
          if (!mounted) return;
          setState(() {
            _questionResults.remove(qIndex);
            _optionResults.remove(oIndex);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Match the numbers\nwith the pictures",
                    style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold,
                      color: Color(0xFF000846),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () => widget.onFinished?.call(_score),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Skip"),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "Select the numbers that match in the pictures.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              GradientProgressBar(
                totalSteps: widget.totalSteps,
                currentStep: widget.currentStep,
                stepScore: _score,
                stepTotal: _questions.length,
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 200,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 18,
                  childAspectRatio: 0.63,
                  children: List.generate(_questions.length, (i) {
                    final result   = _questionResults[i];
                    final selected = _selectedQuestion == i;
                    return GestureDetector(
                      onTap: () => _onQuestionTap(i),
                      child: _ImageCard(
                        assetPaths: _questions[i].imagePaths,
                        selected: selected,
                        result: result,
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 200,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: 0.63,
                  children: List.generate(_options.length, (i) {
                    final result = _optionResults[i];
                    final ctrl   = _shakeControllers[i]!;
                    return GestureDetector(
                      onTap: () => _onOptionTap(i),
                      child: AnimatedBuilder(
                        animation: ctrl,
                        builder: (_, child) {
                          final dx = (ctrl.value < 0.5 ? ctrl.value : 1 - ctrl.value) * 12;
                          return Transform.translate(
                            offset: Offset(dx, 0),
                            child: child,
                          );
                        },
                        child: _NumberCard(
                          imagePath: _options[i].imagePath,
                          result: result,
                          selectionActive: _selectedQuestion != null,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final List<String> assetPaths;
  final bool selected;
  final bool? result;
  const _ImageCard({required this.assetPaths, required this.selected, required this.result});

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.grey.shade200;
    Color bgColor     = Colors.white;
    if (result == true)       { borderColor = Colors.green; bgColor = Colors.green.shade50; }
    else if (result == false) { borderColor = Colors.red;   bgColor = Colors.red.shade50;   }
    else if (selected)        { borderColor = const Color(0xFF5C6BC0); bgColor = const Color(0xFFEEF0FB); }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor, width: selected ? 2 : 1),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: 6, runSpacing: 6,
                  children: assetPaths.map((path) {
                    final size = assetPaths.length > 3 ? 35.0 : 45.0;
                    return SizedBox(width: size, height: size,
                      child: Image.asset(path, fit: BoxFit.contain));
                  }).toList(),
                ),
              ),
            ),
            if (result != null)
              Positioned(top: 8, right: 8,
                child: Icon(
                  result! ? Icons.check_circle : Icons.cancel,
                  color: result! ? Colors.green : Colors.red,
                  size: 20,
                )),
          ],
        ),
      ),
    );
  }
}

class _NumberCard extends StatelessWidget {
  final String imagePath;
  final bool? result;
  final bool selectionActive;
  const _NumberCard({required this.imagePath, required this.result, required this.selectionActive});

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.grey.shade200;
    Color bgColor     = Colors.white;
    if (result == true)       { borderColor = Colors.green; bgColor = Colors.green.shade50; }
    else if (result == false) { borderColor = Colors.red;   bgColor = Colors.red.shade50;   }
    else if (selectionActive) { borderColor = const Color(0xFF5C6BC0).withOpacity(0.4); }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
