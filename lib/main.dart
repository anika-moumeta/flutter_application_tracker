import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Card Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CardListScreen(),
    );
  }
}

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'City of Bangladesh',
            style: TextStyle(
              color: Color.fromARGB(255, 16, 118, 169),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 5,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: demoItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CustomAnimatedCard(item: demoItems[index]),
          );
        },
      ),
    );
  }
}

class CustomAnimatedCard extends StatefulWidget {
  final ItemModel item;

  const CustomAnimatedCard({super.key, required this.item});

  @override
  State<CustomAnimatedCard> createState() => _CustomAnimatedCardState();
}

class _CustomAnimatedCardState extends State<CustomAnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _shadowAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.98,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _shadowAnimation = Tween<double>(
      begin: 8.0,
      end: 2.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (!_isPressed) {
      _controller.forward();
      setState(() {
        _isPressed = true;
      });
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (_isPressed) {
      _controller.reverse();
      setState(() {
        _isPressed = false;
      });
    }
  }

  void _onTapCancel() {
    if (_isPressed) {
      _controller.reverse();
      setState(() {
        _isPressed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Tapped on ${widget.item.title}'),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: _shadowAnimation.value,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image section
                    Hero(
                      tag: 'image-${widget.item.id}',
                      child: Image.network(
                        widget.item.imageUrl,
                        height: 180.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 180.0,
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.error, size: 50.0),
                            ),
                          );
                        },
                      ),
                    ),
                    // Content section
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.item.title,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            widget.item.subtitle,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            widget.item.description,
                            style: const TextStyle(fontSize: 16.0),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Model for card items
class ItemModel {
  final String id;
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;

  const ItemModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
  });
}

// Sample data for the ListView
final List<ItemModel> demoItems = [
  const ItemModel(
    id: '1',
    imageUrl:
        'https://th.bing.com/th/id/OIP.y0m7boBR_xUJeUc4UwsyEwHaE6?w=259&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    title: 'Dhaka',
    subtitle: 'The Capital of Bangladesh',
    description:
        'Dhaka is the capital and largest city of Bangladesh. It is located in the geographic center of the country in the great deltaic region of the Ganges and Brahmaputra rivers.',
  ),
  const ItemModel(
    id: '2',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Shah_Jalal_Mazar_%2803%29.jpg/1024px-Shah_Jalal_Mazar_%2803%29.jpg',
    title: 'Shylet',
    subtitle: 'The City of Tea Hills and natural scenery',
    description:
        'Sylhet is a city in northeastern Bangladesh. It is the capital of the Sylhet Division and is known for its tea gardens, lush green hills, and natural beauty.',
  ),
  const ItemModel(
    id: '3',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Tajhat_Rajbari_-_Side_View_%28cropped%29.jpg/500px-Tajhat_Rajbari_-_Side_View_%28cropped%29.jpg',
    title: 'Rangpur',
    subtitle: 'The City of rich Culturul Heritage and Secenic Lanscape',
    description:
        'Rangpur is a city in northern Bangladesh. It is the capital of the Rangpur Division and is known for its agricultural products, including potatoes and jute.',
  ),
  const ItemModel(
    id: '4',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Administration_Building_of_Rajshshi_College.jpg/1024px-Administration_Building_of_Rajshshi_College.jpg',
    title: 'Rajshahi',
    subtitle: 'The City of Mango and Rice Production',
    description:
        'Rajshahi is a city in northwestern Bangladesh. It is known for its silk industry, mangoes, and archaeological sites. Rajshahi is also home to several educational institutions.',
  ),
  const ItemModel(
    id: '5',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/%E0%A6%B6%E0%A6%B6%E0%A7%80_%E0%A6%B2%E0%A6%9C_%28%E0%A7%A6%E0%A7%A8%29.jpg/500px-%E0%A6%B6%E0%A6%B6%E0%A7%80_%E0%A6%B2%E0%A6%9C_%28%E0%A7%A6%E0%A7%A8%29.jpg',
    title: 'Maymensingh',
    subtitle: 'The City of Education and Culture',
    description:
        'Mymensingh is a city in central Bangladesh. It is known for its educational institutions, including the Bangladesh Agricultural University and Mymensingh Medical College.',
  ),
  const ItemModel(
    id: '6',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Durbar_Bangla_at_kuet.jpg/500px-Durbar_Bangla_at_kuet.jpg',
    title: 'Khulna',
    subtitle: 'The City of Mangrove Forest called Sundarbans',
    description:
        'Khulna is a city in southwestern Bangladesh. It is the gateway to the Sundarbans, the largest mangrove forest in the world and a UNESCO World Heritage Site.',
  ),
  const ItemModel(
    id: '7',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Sunset_at_Patenga_beach.jpg/250px-Sunset_at_Patenga_beach.jpg',
    title: 'Chittagong',
    subtitle: 'The City of Port and Natural Beauty',
    description:
        'Chittagong is the second-largest city in Bangladesh and is known for its port, which is the busiest in the country. The city is also famous for its hills, beaches, and natural beauty.',
  ),
  const ItemModel(
    id: '8',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Academic_Buildings_of_the_University_of_Barishal.jpg/330px-Academic_Buildings_of_the_University_of_Barishal.jpg',
    title: 'Barishal',
    subtitle: 'The City of Rivers and Natural Beauty',
    description:
        'Barishal is a major city that lies on the banks of the Kirtankhola river in south-central Bangladesh. It is one of the oldest municipalities and river ports of the country. The city was once called the Venice of the East or the Venice of Bengal.',
  ),
];
