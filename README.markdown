BarcodeGenerator
================
![anuj barcoded](http://farm2.static.flickr.com/1378/1125817164_6f57adb24a_o.png "sample barcode image")

### Author : Anuj Luthra

Barcode generator makes generating/displaying bar-codes for certain 
alphanumeric ids a piece of cake.
It uses Gbarcode for encoding barcode data and then rmagick to generate 
images out of it for displaying in views.

This way we can generate any barcode type which Gbarcode -> Gnome Barcode project
supports.

## Ruby1.9 note

 please use ruby1.9 compatible gbarcode at [github repository by andreas](http://github.com/ahaller/gbarcode) . Good work mate.

### USAGE:
its as simple as saying 
`<%= barcode 'FJJ4JD'%> `

This will generate a barcode for FJJ4JD in BARCODE_39 format with default width
and height and include it in the view.
the images are stored in /public/images/barcodes subdir.

### Options Options Options:
To customize your barcodes, you can optionally pass following information in your views 

 + encoding_format (Gbarcode constants for eg. Gbarcode::BARCODE_128 etc..)
 + width
 + height
 + scaling_factor
 + xoff
 + yoff
 + margin
 + no_ascii (accepts boolean true or false, prevents the ascii string from printing at the bottom of the barcode)
 
in this case your view will look like :


  <%= barcode 'ANUJ', :height => 100, 
                      :width  => 400,
                      :margin => 100,
                      :xoff   => 20,
		      :yoff   => 40
  %> 


### Installation:
install from git : script/install plugin git://github.com/anujluthra/barcode-generator.git
make sure that you install 

 1. gem for gbarcode
 2. install native ImageMagick library 

### Supported Barcode Formats:
Gbarcode as of now allows us to generate barcodes in following formats:
        BARCODE_EAN
        BARCODE_UPC
        BARCODE_ISBN
        BARCODE_128B
        BARCODE_128C
        BARCODE_128
        BARCODE_128RAW
        BARCODE_39
        BARCODE_I25
        BARCODE_CBR
        BARCODE_MSI
        BARCODE_PLS
        BARCODE_93
        BARCODE_ANY
        BARCODE_NO_CHECKSUM

for more information on Gbarcode visit [rubyforge home of gbarcode](http://gbarcode.rubyforge.org/rdoc/index.html)

