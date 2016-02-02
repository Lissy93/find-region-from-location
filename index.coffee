fs = require('fs')

_private = {}

# Takes the raw CSV string and returns a nice list of JSON region objects
convertCsvToJson = (csvRegions) ->
  regions = []
  for r in csvRegions.splice 1,csvRegions.length # For each line in CSV file
    r = r.match(/(".*?"|[^",\s]+)(?=\s*,|\s*$)/g) # Break into array
    for e, i in r then r[i] = r[i].replace(/['"]+/g, '').trim() # Neaten
    regions.push { # Create a JSON object for region, and push to results
      country: r[0], alpha2_code: r[1], alpha3_code: r[2],
      numeric_code: r[3], latitude: Number(r[4]), longitude: Number(r[5])
    }
  regions # Done, return regions

# Returns an array of objects with one object returned
findAndRemove = (arr, val, property = 'numeric_code') ->
  arr.forEach (res, i) -> if res[property] == val then arr.splice i, 1

findClosestRegions = (regions, key, value) ->
  closestObjects = [] # To be populated and returned
  i = 0
  while i < 8
    closest = regions.reduce((prev, curr) ->
      if Math.abs(curr[key] - value) < Math.abs(prev[key] - value) then curr else prev
    )
    closestObjects.push closest  # Push the object the the results array
    findAndRemove regions, closest.numeric_code  # So we don't find it again
    i++
  closestObjects  # Return completed closest objects


findCountry = (lat, lng) ->

  # Inject regions from CSV file
  csvRegions = fs.readFileSync(__dirname + '/regions.csv', 'utf8').split('\r\n')

  # Convert regions to JSON
  regions = convertCsvToJson csvRegions

  # Make list ordered by closest lat

  console.log findClosestRegions regions, 'latitude', lat
  console.log findClosestRegions regions, 'longitude', lng



#  console.log regions



_private = {
#  arrayifySentence: arrayifySentence
#  formatWordsArr:   formatWordsArr
#  formatSentence:   formatSentence
#  removeDuplicates: removeDuplicates
}


module.exports.findCountry = findCountry

# If we're developing/ testing then export the private methods too
if process.env.NODE_ENV == 'test'
  module.exports = {
    main: removeWords
    _private: _private
  }
