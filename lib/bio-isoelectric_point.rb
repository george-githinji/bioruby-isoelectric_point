require 'bio'
['pka_data', 'extensions', 'aa'].each do |name|
  require File.join(File.expand_path(File.dirname(__FILE__)), 'isoelectric_point',"#{name}")
end

#   protein_seq = Bio::Sequence::AA.new("KKGFTCGELA")
#
# 	#what is the protein charge at ph 14?
# 	charge = protein_seq.charge_at(14)     #=>-2.999795857467562
#
# 	#calculate the pH using dtaselect pka set and round off to 3 decimal places
# 	isoelectric_point = protein_seq.isoelectric_point('dtaselect', 3)   #=>8.219
#
#   puts charge
#   puts isoelectric_point:
