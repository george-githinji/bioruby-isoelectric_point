require 'bio'

['pka_data', 'extensions', 'aa'].each do |name|
  require File.join(File.dirname(__FILE__), 'isoelectric_point', name)
end