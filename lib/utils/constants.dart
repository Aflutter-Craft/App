const String APP_NAME = "Aflutter Craft";

const String BUCKET_PREFIX = "https://aflutter-craft.s3.amazonaws.com/styles/";

const String APP_DISC = '''\n
A platform for style transfer with neural networks
''';

// !! is used as a delimeter to split the questions and answers
const String QUES = '''
How does it work?!!
What is the tech stack?!!
Where can i download those style images?''';

const String ANS = '''
The backbone of the application is a Convolutional Neural Network(CNN) with a very complex network architecutre containting a total of 3 models:
- Pretrained VGG-19: feature extractor, extracts feature maps from images.
- Style Attentional Network: An attention module (transfomer) that gives certain parts of an image different priorities based on some calculations.
- Decoder: a network that transforms the results from SAModule to the final output image.

The image features are first extracterd using VGG's layers from relu_1_1 until relu5_1 and then passed to the SA module which calculates feature importance for both style and content, after that the content features are multiplied by a value between 0-1 called alpha representing the amount of content the final image will have compared to the original content, after that the final image features go through the decoder which results in the final image.

Figure below shows the model architecture, attention module architecture and identity loss network.!!when it comes to the tech stack there are 3 main components to the application, the trained model, an API and this application. the model is of course implemented using PyTorch, and the API is a simple general purpose FastAPI application.

- Model -> python, Pytorch
- API -> python, FastAPI
- Application -> Flutter

Figure below shows the overall process of styling an image.\n!!The style images are taken from wikiart.com wikipedia's equivalent for art.''';

const String PER_SITE = "https://blacksuan19.tk/";
