# desc "Explaining what the task does"
 task :barcode_generator do
  Dir.mkdir("#{RAILS_ROOT}/public/images/barcodes", 0700)

  dirc = "#{RAILS_ROOT}/public/fonts/"
  Dir.mkdir( dirc , 0700 )
  
  #opens/creates files
  font_file = 'FRE3OF9X.TTF'
  source = File.open("#{RAILS_ROOT}/vendor/plugins/barcode_generator/fonts/#{font_file}")
  target = File.open(dirc + "font_file" , "w")
  #copies the source to target, 64 bytes at a time
  target.write( source.read(64) ) while not source.eof?  
  #closes files
  source.close
  target.close
  puts "fonts file installed in public/fonts dir"
 end