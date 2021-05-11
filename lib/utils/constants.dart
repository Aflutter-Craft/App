import 'package:universal_io/io.dart';

const String APP_NAME = "Aflutter Craft";

const String BUCKET_PREFIX = "https://aflutter-craft.s3.amazonaws.com/styles/";

const String APP_DISC = '''\n
A platform for style transfer with neural networks
''';

const String PER_SITE = "https://blacksuan19.tk/";

const String mobileTip =
    '''Click on any of the images to select content or style, Long Click to view image in full size.''';

// API endpoint
const String API_ENDPOINT =
    "https://www.floydlabs.com/serve/blacksuan19/projects/aflutter-craft";
// check the current platform
final bool isMobile = Platform.isAndroid || Platform.isIOS;
