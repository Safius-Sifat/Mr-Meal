'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"main.dart.js": "df0f365f66192f26965c417bff25f40b",
"index.html": "6201788e13375d8eb8866ca2a6dc9f00",
"/": "6201788e13375d8eb8866ca2a6dc9f00",
"splash/img/dark-4x.png": "e4772dfb67313e39c0f83a42ea707c4a",
"splash/img/light-1x.png": "201e54ea4954f3d6f2feaedd39bb83bf",
"splash/img/dark-3x.png": "4bb27fe7ab6a5c5f3a11267cf9377785",
"splash/img/light-4x.png": "e4772dfb67313e39c0f83a42ea707c4a",
"splash/img/light-2x.png": "b36c92d074e28c0ba226ac9539d7d2eb",
"splash/img/dark-1x.png": "201e54ea4954f3d6f2feaedd39bb83bf",
"splash/img/light-3x.png": "4bb27fe7ab6a5c5f3a11267cf9377785",
"splash/img/dark-2x.png": "b36c92d074e28c0ba226ac9539d7d2eb",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"manifest.json": "ea64e5d95c98495f61a442a84eb28174",
"version.json": "ef779bc6df9d798c22bb6e7764654ed2",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/fonts/MaterialIcons-Regular.otf": "91c46e600add8d70f93112b10bec96ef",
"assets/NOTICES": "38b1dffad737bd83d2d7a7ae67c7ee95",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/Cupcake.png": "b2212ad37c2b632eea30cabf9d225716",
"assets/assets/package-1.png": "e589403271141deb0e925c734ec737b9",
"assets/assets/1.jpg": "fbce3b1b4ffb0aa149e0552c030402fb",
"assets/assets/food-5.png": "700d4f7a212c5f433197518f18ad2190",
"assets/assets/Turkey.png": "0a02b0471a9fbaf392d2848db9d2e692",
"assets/assets/profile.svg": "99c640205e47f18a11802ed3d95bc45f",
"assets/assets/2.jpg": "0d02b3efdd2494b069c471c384dd6ea4",
"assets/assets/Paper%2520bag.png": "c6be9358db968787a3351bebc1cc5d1d",
"assets/assets/Create.png": "0420c834b4d0dfed463f8ca41355c307",
"assets/assets/order.svg": "3f03e5d0da26b3cf0e2bedc7893ab20b",
"assets/assets/avatar.png": "b53f8bfb400d6bc01612a81852bf6a17",
"assets/assets/Crisps.png": "0aed42351a533f5ea83260ddcf1605f6",
"assets/assets/Dish.png": "0a37b0ab9e3a6db4b9ebd37db3b0bcf9",
"assets/assets/Fried%2520rice.png": "61ba102a0e74467ec5bf76f5284abeb3",
"assets/assets/food-3.png": "a8570fe3eabecaf23d799e2e265b3683",
"assets/assets/food-1.png": "1285ecf9bacf2506c51789ddff8dc9b9",
"assets/assets/package-2.png": "e7313f8178c1260168f71a2a5f491832",
"assets/assets/cart.svg": "971fd81e158db603309ae8f0c9f8f994",
"assets/assets/Menu.png": "97ceb8eac2e48270e1e17a4e7e930a26",
"assets/assets/Discount.png": "d861b89ca36a8938f970c06866336825",
"assets/assets/logo.png": "66848671b5b8f1171202a9f7d2fd2d7f",
"assets/assets/letter.png": "122ff96d7a912daa8bc40506ee36914e",
"assets/assets/food-2.png": "f2ccab7e243eed4b16456112097c812f",
"assets/assets/login_image.png": "e1f595bbbca3f335951b10023dfde67a",
"assets/assets/Breakfast.png": "f6f09dbf7d3a31597125d92204c1ae31",
"assets/assets/guest_star.png": "9554b3db534829d59144ae4e461491bc",
"assets/assets/splash_image.png": "3b601ef8b400195e3e70d15ac862885d",
"assets/assets/splash.png": "390abbd8fa53b0a472910a952870208b",
"assets/assets/food-6.png": "0f58fda714f8e6407040a1740ef378b4",
"assets/assets/Lunch%2520time.png": "939a05a8a6351615c865de2b6642cba6",
"assets/assets/home.svg": "3881ade63f5992fb01fc2f4a990dbfce",
"assets/assets/package-4.png": "9845c641937af83e820382e423e9fe43",
"assets/assets/alarm.svg": "3c9de785ecc877226d9a61c83d64b312",
"assets/assets/Food%2520delivery.png": "dd1d782bee20d36e63a2228fead537e9",
"assets/assets/favorite.svg": "4137e5284f8c7ece6913f18ab0a0887d",
"assets/assets/welcome.png": "d0b048c54247a6b187a5e78cb2e4868c",
"assets/assets/package-3.png": "c22ed6b56f790cb6eadc1306e15bfe60",
"assets/assets/food-8.png": "98a7445341fdd7ef63efb48118b43cdb",
"assets/assets/hero.png": "0803c8e5562840dfa13739f3e29f3829",
"assets/assets/food-4.png": "3b17c157eef6f3e92c236a6c1c69d681",
"assets/assets/google.png": "8cad2962a037f42e9a722fc3994fa417",
"assets/assets/Sale%2520tag.png": "afb1596088736fdb3d1560f2ed066134",
"assets/assets/search.svg": "ec6d84b9604d86ad148e74c8b119baae",
"assets/assets/location.svg": "67e0ce23cce919424db7443485b86ece",
"assets/assets/Chat.png": "846b27e5c21531569cea3923ed779ed1",
"assets/assets/food-7.png": "90e4a50ac6d71f4361908ba7e3b4fe69",
"assets/AssetManifest.json": "ac0d1ef5fa3110543807bd9b81e1d863",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.bin.json": "7d207c9ae6904d488a0acd736c5dcac8",
"assets/AssetManifest.bin": "0ef247f6816a40fc2bb0899dabbae172",
"flutter_bootstrap.js": "efdad83a01669fb4b8f1cc32ec785752",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"flutter.js": "f393d3c16b631f36852323de8e583132"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
