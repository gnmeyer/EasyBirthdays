'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon%203.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart%209.js": "fb44f8e6dba11f86990985913244fb5a",
"favicon%202.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "88ff3489ac6b545b129a1d7701ebdd86",
"manifest%2013.json": "f0702a6210019dd0eb4c00982039b281",
"manifest%2012.json": "f0702a6210019dd0eb4c00982039b281",
"favicon%205.png": "5dcef449791fa27946b3d35ad8803796",
"index.html": "94a2b18aca5ea9e359ec36c3e3fc8395",
"/": "94a2b18aca5ea9e359ec36c3e3fc8395",
"favicon%204.png": "5dcef449791fa27946b3d35ad8803796",
"favicon%206.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart%208.js": "de96233723b684a03e5b17bb09bec315",
"favicon%207.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart%203.js": "ed4d3e09b450e03d6867a1ef5fb02a45",
"manifest%206.json": "f0702a6210019dd0eb4c00982039b281",
"main.dart.js": "80a310b9cf5f3bc18ec025b0d153708e",
"manifest%2015.json": "f0702a6210019dd0eb4c00982039b281",
"main.dart%207.js": "f114554132b858b1843068757bd57384",
"manifest%2019.json": "f0702a6210019dd0eb4c00982039b281",
"main.dart%206.js": "66eb433c24a7d133602728838106baa1",
"manifest%2018.json": "f0702a6210019dd0eb4c00982039b281",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"main.dart%2012.js": "a8acefcf2004f4d69dcc41b44b26e888",
"manifest%2014.json": "f0702a6210019dd0eb4c00982039b281",
"main.dart%202.js": "b3afeed95853761a17923a70ab80ec47",
"manifest%207.json": "f0702a6210019dd0eb4c00982039b281",
"manifest%2017.json": "f0702a6210019dd0eb4c00982039b281",
"main.dart%205.js": "8e399b70feba617d10b5e2af61e3f5f8",
"manifest%204.json": "f0702a6210019dd0eb4c00982039b281",
"main.dart%2011.js": "b3e02fb393058dec53a91c69be01cbd4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest%208.json": "f0702a6210019dd0eb4c00982039b281",
"manifest%209.json": "f0702a6210019dd0eb4c00982039b281",
"icons/Icon-maskable-192%203.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192%2017.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-192%2016.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192%202.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512%2018.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192%203.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-192%2014.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-192%2015.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-192%202.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512%2019.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192%205.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192%206.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-192%2011.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-192%2010.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-192%207.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192%204.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-192%206.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192%205.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-192%2012.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-192%2013.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-192%204.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192%207.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512%2010.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512%2011.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-512%2013.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512%2012.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-512%2016.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512%209.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-512%208.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512%2017.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-512%209.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-512%2015.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-512%2014.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-512%208.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-512%205.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-512%2019.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512%206.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192%2015.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-192%2014.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512%207.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512%2018.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-512%204.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-512%206.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512%205.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192%2016.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-192%2017.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512%204.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512%207.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-512%203.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192%2013.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-192%2012.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512%202.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-512%2020.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512%203.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192%2010.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-192%2011.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512%202.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-512%2012.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192%209.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-192%208.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512%2013.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192%209.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512%2011.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-512%2010.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192%208.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512%2014.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-512%2015.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-512%2017.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-512%2016.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "f0702a6210019dd0eb4c00982039b281",
"main.dart%204.js": "b83c308aae37ea91fdd4aa829298518d",
"manifest%205.json": "f0702a6210019dd0eb4c00982039b281",
"manifest%2016.json": "f0702a6210019dd0eb4c00982039b281",
"main.dart%2010.js": "12072b1c1073447ce659ceac988da65c",
"favicon%2011.png": "5dcef449791fa27946b3d35ad8803796",
"favicon%2010.png": "5dcef449791fa27946b3d35ad8803796",
"manifest%2011.json": "f0702a6210019dd0eb4c00982039b281",
"favicon%209.png": "5dcef449791fa27946b3d35ad8803796",
"favicon%2012.png": "5dcef449791fa27946b3d35ad8803796",
"manifest%202.json": "f0702a6210019dd0eb4c00982039b281",
"favicon%2013.png": "5dcef449791fa27946b3d35ad8803796",
"favicon%208.png": "5dcef449791fa27946b3d35ad8803796",
"assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"assets/NOTICES": "80755a1d64c72f878db375123186f50d",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons%2015.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons%2014.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons%2016.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons%2013.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons%2012.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons%2010.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons%208.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons%209.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons%2011.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons%204.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons%205.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons%207.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons%206.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons%202.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/cupertino_icons/assets/CupertinoIcons%203.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular%2010.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/MaterialIcons-Regular%2011.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/MaterialIcons-Regular%2012.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/MaterialIcons-Regular%206.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/MaterialIcons-Regular%207.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/MaterialIcons-Regular%205.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/MaterialIcons-Regular%204.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/MaterialIcons-Regular%203.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/MaterialIcons-Regular%202.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/MaterialIcons-Regular%209.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/MaterialIcons-Regular%208.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"favicon%2017.png": "5dcef449791fa27946b3d35ad8803796",
"manifest%203.json": "f0702a6210019dd0eb4c00982039b281",
"favicon%2016.png": "5dcef449791fa27946b3d35ad8803796",
"manifest%2010.json": "f0702a6210019dd0eb4c00982039b281",
"favicon%2014.png": "5dcef449791fa27946b3d35ad8803796",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"favicon%2015.png": "5dcef449791fa27946b3d35ad8803796"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
