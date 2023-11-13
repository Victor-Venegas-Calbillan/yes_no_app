import 'package:flutter/material.dart';

class OtherMessageBubble extends StatelessWidget {
  const OtherMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(15)
          ),
          child:  const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('hola mundo',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble(),
        const SizedBox(height: 10),

        //todo: add image
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  //obtener dimesion del dispositivo
  Widget build(BuildContext context) {
  final Size size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network('https://yesno.wtf/assets/yes/3-422e51268d64d78241720a7de52fe121.gif', 
        width: size.width * 0.6,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress == null) return child;

          return Container(
            width: size.width * 0.6,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('loading...'),
          );
        },
      )
    );
  }
}