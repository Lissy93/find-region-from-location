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

# Returns a region object closest to a given latitude and longitude
findRegion = (lat, lng) ->

  # Inject regions from CSV file
  csvRegions = fs.readFileSync(__dirname + '/regions.csv', 'utf8').split('\r\n')

  # Convert regions to JSON
  regions = convertCsvToJson csvRegions

  # Find difference between our location and region location
  for r in regions
    r.diff= Math.round(Math.abs(r.latitude - lat) + Math.abs(r.longitude - lng))

  # Sort regions by closest first
  regions.sort (a, b) -> parseFloat(a.diff) - parseFloat(b.diff)

  regions[0] # Return closest region

# Create and export functions
module.exports.country      = (lat, lng) -> findRegion(lat, lng).country
module.exports.alpha2_code  = (lat, lng) -> findRegion(lat, lng).alpha2_code
module.exports.alpha3_code  = (lat, lng) -> findRegion(lat, lng).alpha3_code
module.exports.numeric_code = (lat, lng) -> findRegion(lat, lng).numeric_code
module.exports.regionObject = findRegion
