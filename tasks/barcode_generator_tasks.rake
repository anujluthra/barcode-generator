# desc "Explaining what the task does"
 task :barcode_setup do
  Dir.mkdir("#{RAILS_ROOT}/public/images/barcodes", 0700)
  puts "CREATED BARCODE DIR IN PUBLIC/IMAGES"
 end
