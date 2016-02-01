fs = require('fs')

_private = {}

findCountry = () ->
  regions = fs.readFileSync(__dirname + '/regions.csv', 'utf8').split('\r\n')

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
