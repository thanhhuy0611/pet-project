part of '../index.dart';

class DiscoverAddButton extends StatelessWidget with ElevatedButtonDecoration {
  final void Function() onTap;
  const DiscoverAddButton({Key? key, required this.onTap}) : super(key: key);

  Color get beginGradientColor => const Color(0xFFFF00D6);

  Color get endGradientColor => const Color(0xFFFF4D00);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(
          begin:  const Alignment(-1.0, 0.0),
          end:  const Alignment(1.0, 0.0),
          colors: [beginGradientColor, endGradientColor],
          stops:  const [0.0, 1.0],
        ),
      ),
      width: MediaQuery.of(context).size.width / 5,
      child: ElevatedButton(
        style: buttonStadiumStyle(context, color: Colors.transparent),
        onPressed: onTap,
        child: IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
