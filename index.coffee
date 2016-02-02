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


findCountry = (latitde, longitude) ->

  # Inject regions from CSV file
  csvRegions = fs.readFileSync(__dirname + '/regions.csv', 'utf8').split('\r\n')

  # Convert regions to JSON
  regions = convertCsvToJson csvRegions
  console.log regions

  # Make list ordered by closest lat
#  regions.sort (a, b) -> parseFloat(a.freq) - parseFloat(b.freq)

# Make list ordered by closes lng
  # Find LCD



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
