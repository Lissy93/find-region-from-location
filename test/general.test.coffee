expect = require('chai').expect

process.env.NODE_ENV = 'test'

findRegion = require('../index')

describe 'Check the main module returns correct data', ()->

  it 'Should return the correct country name for a lat and lng', ()->
   expect(findRegion.country 48.85, 2.3).eql 'France'
   expect(findRegion.country 58.75, 90.6).eql 'Russia'
   expect(findRegion.country 54, 1.6).eql 'United Kingdom'

  it 'Should find the correct numeric code for countries', ()->
    expect(findRegion.numeric_code 39, 22).eql '300'
    expect(findRegion.numeric_code 26.53, 86.73).eql '524'
    expect(findRegion.numeric_code 23.3825671,122.2481364).eql '158'

