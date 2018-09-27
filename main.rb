require 'rubygems'
require 'bundler'

Bundler.require(:default)

if ARGV.include?('scrape')
  require './scraper'
  require './chars'
  require './log_saver'
  require './homestuck'

  Scraper.start!
end