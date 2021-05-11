'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "07b2582097dc8ce2b69a2f2de6ff4729",
"assets/assets/texts/nude-painting-nu.txt": "171e6a991fcfd74ece31efbc3b25b0e8",
"assets/assets/texts/still-life.txt": "1f3f65450eab361d4fb9fdc1d0a6ef33",
"assets/assets/texts/genre-painting.txt": "113fbed6cb70fd4a030b0539c9062044",
"assets/assets/texts/mythological-painting.txt": "434ac2cea4c2a5eafe7a79ff89e95bbc",
"assets/assets/texts/religious-painting.txt": "6ae7dca7cea9c88175ca0a629b4d9915",
"assets/assets/texts/flower-painting.txt": "f0af45563864952cb8e3bb5919aa246f",
"assets/assets/texts/figurative.txt": "1a1e1a80c9c58b76f175c0bf1d582127",
"assets/assets/texts/marina.txt": "2e4afe1c28a8df8aa5b7df889dcf230c",
"assets/assets/texts/symbolic-painting.txt": "521fd0753cee2ce808eab92c778a83ff",
"assets/assets/texts/animal-painting.txt": "2f80ee5efce8372b2326d04919108832",
"assets/assets/texts/landscape.txt": "6f29097b509ed247c9780322a5b2c56e",
"assets/assets/texts/cityscape.txt": "ae037a727165120eba0a4548d26c4239",
"assets/assets/texts/abstract.txt": "c8ec066a0bbbba5242a5d7b5ac122718",
"assets/assets/texts/portrait.txt": "519a11fc3ff129daae3cfb5feae225ce",
"assets/assets/images/network.png": "4a9c2d6159ecf973c35dfff3ccf89de8",
"assets/assets/images/default_content.jpg": "a24a570b85d327963d00e204f896aa84",
"assets/assets/images/default_style.jpg": "00684c616313b07a5472b3ddc020ba21",
"assets/assets/images/logo.png": "79057faeed7e349cd81916ed1cafbbb6",
"assets/assets/images/api.png": "d962f64813de2278f918dc8984c33640",
"assets/assets/images/default_result.jpg": "851ebf143a47a255232562a286419ef7",
"assets/assets/images/attention.png": "0ff2a30519680902774c309f0a777660",
"assets/AssetManifest.json": "e3235a2ede5d5b450c93ab84fd5e08b2",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "6e67b0fdc198982a4a3a902a14ac9dc2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"version.json": "c721b61c4eb20627879b03bfd656e30a",
"manifest.json": "0961dbe3ff9d37ca2ca435fcf66c2b0c",
"icons/site.webmanifest": "97272818487177521210d86ea684d1ef",
"icons/favicon-16x16.png": "e02dd1001ac143249d9375b7d8fec863",
"icons/favicon-32x32.png": "3c19443449c0e65e62aa5ff0327c5fab",
"icons/safari-pinned-tab.svg": "79e33c79e49b6d0e4857c179ced0ea5a",
"icons/apple-touch-icon.png": "fd249410a6d03cc37fff1c49626230c6",
"icons/android-chrome-192x192.png": "f6afe63aabe3359331b5d4771118699a",
"icons/mstile-150x150.png": "5082474d90ba365f48dbedb8acae4dc4",
"icons/favicon.ico": "c25d0c5b1e6c37b0396ff60a2d393510",
"icons/browserconfig.xml": "99effbcd7a7597f2340c4f91965fa15c",
"icons/android-chrome-512x512.png": "977f182506ea64404d4a61939ab7e654",
"splash/style.css": "df0bb766ac85cb0a5db2fa72057db3b6",
"splash/img/light-2x.png": "2e4ddc8d8e16407bef4f4ae071ed7d31",
"splash/img/dark-1x.png": "611ca38b81b55e4c7998310f15b4f108",
"splash/img/light-1x.png": "611ca38b81b55e4c7998310f15b4f108",
"splash/img/light-3x.png": "7d2738cfa4a251f732161f57c4b496eb",
"splash/img/dark-2x.png": "2e4ddc8d8e16407bef4f4ae071ed7d31",
"splash/img/dark-3x.png": "7d2738cfa4a251f732161f57c4b496eb",
"index.html": "e00658d3cc4ae73514095a06da388577",
"/": "e00658d3cc4ae73514095a06da388577"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
