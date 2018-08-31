# iTunesSearch
Practical exercise for intive-FDV.

The app consists of a simple media content search engine that uses iTunes Search API.

### Usage

```shell
git clone git@github.com:gmoyano11/iTunesSearch.git
```

### iTunes Search API Reference

https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api

### Third Party Libraries

Alamofire - https://github.com/Alamofire/Alamofire

### Possible Improvements

A good improvement for the performance of the app would be adding a library that manages image caching (such as AlamofireImage), since right now the images are downloaded via the ```load``` function (```UIImage``` extension) and, while scrolling through search results, the same images are downloaded over and over again when a ```MediaContentCell``` is reused.
