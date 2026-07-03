import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/achievements/presentations/views/widgets/gradient_progress_bar.dart';

class _Q { final String img, label; const _Q(this.img, this.label); }
class _O { final String img, label; const _O(this.img, this.label); }

class LessonsMatchAnimalsView extends StatefulWidget {
  final int totalSteps, currentStep, accumulatedScore, accumulatedTotal;
  final void Function(int)? onFinished;
  final void Function(int, int)? onProgress;
  const LessonsMatchAnimalsView({super.key,
    required this.totalSteps, required this.currentStep,
    this.accumulatedScore=0, this.accumulatedTotal=0,
    this.onFinished, this.onProgress});
  @override State<LessonsMatchAnimalsView> createState() => _LessonsMatchAnimalsViewState();
}

class _LessonsMatchAnimalsViewState extends State<LessonsMatchAnimalsView> with TickerProviderStateMixin {
  final List<_Q> _questions = const [
    _Q('assets/images/cat.png','cat'), _Q('assets/images/bird.png','bird'), _Q('assets/images/dog.png','dog'),
  ];
  final List<_O> _options = const [
    _O('assets/images/dogtext.png','dog'), _O('assets/images/birdtext.png','bird'), _O('assets/images/cattext.png','cat'),
  ];

  int? _sel;
  final Map<int,bool?> _qR={}, _oR={};
  int _score=0;
  final Map<int,AnimationController> _shake={};

  bool get _done => _qR.length==_questions.length && _qR.values.every((v)=>v==true);

  @override
  void initState() {
    super.initState();
    for(int i=0;i<_options.length;i++){
      _shake[i]=AnimationController(vsync:this,duration:const Duration(milliseconds:400));
    }
  }
  @override void dispose(){ for(final c in _shake.values) c.dispose(); super.dispose(); }

  void _qTap(int i){ if(_qR[i]==true)return; setState((){_sel=(_sel==i)?null:i;}); }

  void _oTap(int i){
    if(_sel==null||_oR[i]==true)return;
    final q=_sel!;
    final ok=_questions[q].label==_options[i].label;
    setState((){
      if(ok){
        _qR[q]=true; _oR[i]=true; _score++; _sel=null;
        widget.onProgress?.call(_score,_questions.length);
        if(_done) Future.delayed(const Duration(milliseconds:600),()=>widget.onFinished?.call(_score));
      } else {
        _qR[q]=false; _oR[i]=false;
        _shake[i]?.forward(from:0);
        Future.delayed(const Duration(milliseconds:700),(){
          if(!mounted)return;
          setState((){_qR.remove(q);_oR.remove(i);});
        });
      }
    });
  }

  @override
  Widget build(BuildContext ctx) => Scaffold(
    backgroundColor: const Color(0xffF8F9FD),
    body: SafeArea(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal:16,vertical:30),
      child: Column(crossAxisAlignment:CrossAxisAlignment.start, children:[
        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
          crossAxisAlignment:CrossAxisAlignment.start,
          children:[
            const Text('Hear the sound and\nmatch it to the letter',
              style:TextStyle(fontSize:24,fontWeight:FontWeight.bold,color:Color(0xFF000846))),
            OutlinedButton(
              onPressed:()=>widget.onFinished?.call(_score),
              style:OutlinedButton.styleFrom(shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(12))),
              child:const Text('Skip')),
          ]),
        const SizedBox(height:8),
        const Text('Select the shapes that match the word.',style:TextStyle(fontSize:16,color:Colors.grey)),
        const SizedBox(height:12),
        GradientProgressBar(totalSteps:widget.totalSteps,currentStep:widget.currentStep,
          stepScore:_score,stepTotal:_questions.length),
        const SizedBox(height:32),
        SizedBox(height:160,child:GridView.count(
          physics:const NeverScrollableScrollPhysics(),
          crossAxisCount:3,crossAxisSpacing:12,childAspectRatio:0.9,
          children:List.generate(_questions.length,(i){
            final r=_qR[i]; final sel=_sel==i;
            return GestureDetector(onTap:()=>_qTap(i),child:_Card(
              img:_questions[i].img, selected:sel, result:r, isTop:true));
          }))),
        const SizedBox(height:20),
        SizedBox(height:160,child:GridView.count(
          physics:const NeverScrollableScrollPhysics(),
          crossAxisCount:3,crossAxisSpacing:12,childAspectRatio:0.9,
          children:List.generate(_options.length,(i){
            final r=_oR[i]; final ctrl=_shake[i]!;
            return GestureDetector(onTap:()=>_oTap(i),child:AnimatedBuilder(
              animation:ctrl,
              builder:(_,child){
                final dx=(ctrl.value<0.5?ctrl.value:1-ctrl.value)*12;
                return Transform.translate(offset:Offset(dx,0),child:child);
              },
              child:_Card(img:_options[i].img,selected:false,result:r,
                isTop:false,selActive:_sel!=null)));
          }))),
      ]),
    )),
  );
}

class _Card extends StatelessWidget {
  final String img;
  final bool selected, isTop;
  final bool selActive;
  final bool? result;
  const _Card({required this.img,required this.selected,required this.result,
    required this.isTop, this.selActive=false});

  @override
  Widget build(BuildContext ctx){
    Color border=Colors.grey.shade200, bg=Colors.white;
    if(result==true){border=Colors.green;bg=Colors.green.shade50;}
    else if(result==false){border=Colors.red;bg=Colors.red.shade50;}
    else if(selected){border=const Color(0xFF5C6BC0);bg=const Color(0xFFEEF0FB);}
    else if(!isTop&&selActive){border=const Color(0xFF5C6BC0).withOpacity(0.4);}

    return AnimatedContainer(
      duration:const Duration(milliseconds:200),
      decoration:BoxDecoration(color:bg,borderRadius:BorderRadius.circular(24),
        border:Border.all(color:border,width:selected?2:1.5),
        boxShadow:[BoxShadow(color:Colors.black.withOpacity(.05),blurRadius:10,offset:const Offset(0,4))]),
      child:Stack(children:[
        Center(child:Padding(padding:const EdgeInsets.all(16),
          child:Image.asset(img,fit:BoxFit.contain))),
        if(result!=null) Positioned(top:8,right:8,child:Icon(
          result!?Icons.check_circle:Icons.cancel,
          color:result!?Colors.green:Colors.red,size:20)),
      ]),
    );
  }
}
