import 'package:flutter/material.dart';

void main() {
  runApp(const AIEducationApp());
}

class AIEducationApp extends StatelessWidget {
  const AIEducationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Training Guide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0052CC), // Tech blue
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

// Data Model
class Topic {
  final String title;
  final String description;
  final String content;
  final IconData icon;

  const Topic({
    required this.title,
    required this.description,
    required this.content,
    required this.icon,
  });
}

// Mock Data based on user request
final List<Topic> topics = [
  const Topic(
    title: 'Main Pattern of AI Training',
    description: 'Understand the core loop of training models.',
    icon: Icons.loop,
    content: '''
The fundamental pattern of AI training (specifically Deep Learning) follows a cyclical process known as the "Training Loop":

1. **Forward Pass**: 
   Input data is passed through the neural network. The model makes a prediction based on its current parameters (weights and biases).

2. **Loss Calculation**: 
   The model's prediction is compared to the actual target (ground truth). A "Loss Function" (like Mean Squared Error or Cross-Entropy) calculates a score representing how wrong the model was.

3. **Backward Pass (Backpropagation)**: 
   We calculate the gradient of the loss with respect to every parameter in the network. This tells us which direction to adjust each weight to reduce the error.

4. **Optimizer Step**: 
   An optimization algorithm (like SGD or Adam) updates the weights using the calculated gradients.

This loop repeats for many "epochs" until the loss is minimized and the model performs well.
    ''',
  ),
  const Topic(
    title: 'How AI Works',
    description: 'The basics of Neural Networks and layers.',
    icon: Icons.psychology,
    content: '''
At its core, modern AI (Neural Networks) is a universal function approximator.

**1. Neurons & Layers:**
AI is built of layers of artificial neurons. Each neuron takes inputs, multiplies them by "weights", adds a "bias", and passes the result through an "activation function" (like ReLU or Sigmoid).

**2. Pattern Recognition:**
- **Early layers** might detect simple patterns (edges, colors).
- **Middle layers** combine these into shapes or textures.
- **Deep layers** recognize complex concepts (faces, objects, sentences).

**3. Representation:**
AI works by transforming data into high-dimensional vector spaces (embeddings) where similar concepts are mathematically close to each other.
    ''',
  ),
  const Topic(
    title: 'What to Learn',
    description: 'Key skills required to train AI effectively.',
    icon: Icons.school,
    content: '''
To train AI effectively, you need a mix of theoretical and practical skills:

**1. Mathematics (The Foundation):**
- **Linear Algebra**: Matrix operations, vectors (crucial for data representation).
- **Calculus**: Derivatives and chain rule (essential for understanding backpropagation).
- **Probability & Statistics**: Understanding data distributions and uncertainty.

**2. Programming:**
- **Python**: The lingua franca of AI.
- **Libraries**: PyTorch or TensorFlow (the main frameworks).
- **Data Manipulation**: NumPy, Pandas.

**3. Core Concepts:**
- Overfitting vs. Underfitting.
- Regularization techniques (Dropout, Weight Decay).
- Hyperparameter tuning (Learning rate, Batch size).
    ''',
  ),
  const Topic(
    title: 'Where to Start',
    description: 'A roadmap for your AI journey.',
    icon: Icons.map,
    content: '''
Here is a recommended path to get started:

**Step 1: Basics**
Learn Python if you haven't already. Get comfortable with syntax and basic data structures.

**Step 2: Hands-on Course**
Start with a practical course. 
- *Fast.ai* (highly recommended for "top-down" learning).
- *DeepLearning.AI* (Andrew Ng's courses for foundational theory).

**Step 3: Build Simple Models**
Don't just read. Build:
- A digit classifier (MNIST dataset).
- A dog vs. cat classifier.
- A simple text generator.

**Step 4: Read & Replicate**
Read simplified versions of research papers and try to implement them in code.

**Step 5: Join Communities**
Participate in Kaggle competitions or join AI Discord servers to learn from others.
    ''',
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Training Guide'),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopicDetailScreen(topic: topic),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      child: Icon(
                        topic.icon,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            topic.title,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            topic.description,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.grey[600],
                                ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Colors.grey),
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

class TopicDetailScreen extends StatelessWidget {
  final Topic topic;

  const TopicDetailScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: topic.title,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(topic.icon, size: 32, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        topic.description,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Details',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              topic.content,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.6,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
