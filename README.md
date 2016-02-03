# find-region-from-location 
[![Build Status](https://travis-ci.org/Lissy93/find-region-from-location.svg?branch=master)](https://travis-ci.org/Lissy93/find-region-from-location)
[![Dependency Status](https://david-dm.org/lissy93/find-region-from-location.svg)](https://david-dm.org/lissy93/find-region-from-location)
[![devDependency Status](https://david-dm.org/lissy93/find-region-from-location/dev-status.svg)](https://david-dm.org/lissy93/find-region-from-location#info=devDependencies)
[![Code Climate](https://codeclimate.com/github/Lissy93/find-region-from-location/badges/gpa.svg)](https://codeclimate.com/github/Lissy93/find-region-from-location)
> Node module to find closest region for a given latitude and longitude

## Install
`npm install https://github.com/Lissy93/find-region-from-location --save`

## Usage
```javascript
var findRegion =  require('find-region-from-location');

findRegion.country(52.2, -1.6); // 'United Kingdom'
findRegion.alpha2_code(-8.29, -50); // 'BR'
findRegion.alpha3_code(40, -3); // 'ESP'
findRegion.numeric_code(48.8,2.5); // '250'

```
There are 5 functions, `country(lat, lng)`, `alpha2_code(lat, lng)`, `alpha3_code(lat, lng)`, `numeric_code(lat, lng)` and  `regionObject(lat, lng)`

`regionObject(latitude, longitude)` will return data in the following format:
```json
{ 
    country: 'France',
    alpha2_code: 'FR',
    alpha3_code: 'FRA',
    numeric_code: '250',
    latitude: 46,
    longitude: 2,
    diff: 3 
}
```



## Testing
`npm test`

See unit test, integration testing results on [Travis CI]

## Development
See the `gulpfile.js` for documentation of build process.

## License
MIT � [Alicia Sykes](http://aliciasykes.com)

[Travis CI]: <https://travis-ci.org/Lissy93/find-region-from-location>
