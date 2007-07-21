# desc "Explaining what the task does"
 task :barcode_setup do
  require "ftools"
  Dir.mkdir("#{RAILS_ROOT}/public/images/barcodes", 0700)
  dirc = "#{RAILS_ROOT}/public/fonts/"
  Dir.mkdir( dirc , 0700 )  
  #opens/creates files
  font_file = 'FRE3OF9X.TTF'
  source = "#{RAILS_ROOT}/vendor/plugins/barcode_generator/fonts/#{font_file}"
  target = "#{dirc}#{font_file}"
  
  File.copy(source, target)
  puts "fonts file installed in public/fonts dir"
 end
