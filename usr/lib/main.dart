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

// Data Models
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

class Course {
  final String title;
  final String provider;
  final String description;
  final String level;
  final String url;

  const Course({
    required this.title,
    required this.provider,
    required this.description,
    required this.level,
    required this.url,
  });
}

// Mock Data
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

final List<Course> freeCourses = [
  const Course(
    title: 'Elements of AI',
    provider: 'University of Helsinki',
    description: 'A series of free online courses created by Reaktor and the University of Helsinki. Great for non-technical beginners to understand what AI is.',
    level: 'Beginner',
    url: 'elementsofai.com',
  ),
  const Course(
    title: 'Practical Deep Learning for Coders',
    provider: 'fast.ai',
    description: 'Top-down approach to deep learning. Get models running first, then learn the theory. Highly recommended for developers.',
    level: 'Intermediate',
    url: 'course.fast.ai',
  ),
  const Course(
    title: 'Machine Learning Specialization',
    provider: 'DeepLearning.AI (Andrew Ng)',
    description: 'The most famous course in AI. Covers the fundamentals of machine learning. (Audit for free on Coursera).',
    level: 'Beginner/Intermediate',
    url: 'coursera.org',
  ),
  const Course(
    title: 'Google AI Courses',
    provider: 'Google',
    description: 'Flexible online training programs designed by Google experts. Covers Generative AI, LLMs, and more.',
    level: 'All Levels',
    url: 'grow.google/ai',
  ),
  const Course(
    title: 'CS50\'s Introduction to AI with Python',
    provider: 'Harvard University (edX)',
    description: 'Explores the concepts and algorithms at the foundation of modern artificial intelligence.',
    level: 'Intermediate',
    url: 'edx.org/course/cs50s-introduction-to-artificial-intelligence-with-python',
  ),
  const Course(
    title: 'Intro to Deep Learning',
    provider: 'Kaggle',
    description: 'Fast-paced, practical introduction to deep learning using TensorFlow and Keras.',
    level: 'Beginner',
    url: 'kaggle.com/learn/intro-to-deep-learning',
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
        actions: [
          IconButton(
            icon: const Icon(Icons.school_outlined),
            tooltip: 'Free Courses',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CoursesListScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Banner for Courses
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            child: Material(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(16),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CoursesListScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Looking for Free Courses?',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tap here to see a curated list of free AI learning resources.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.9),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
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
          ),
        ],
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

class CoursesListScreen extends StatelessWidget {
  const CoursesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free AI Courses'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: freeCourses.length,
        itemBuilder: (context, index) {
          final course = freeCourses[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          course.title,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          course.level,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSecondaryContainer,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'By ${course.provider}',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    course.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.link, size: 20, color: Colors.grey),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            course.url,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
