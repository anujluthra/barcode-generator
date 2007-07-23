# BarcodeGenerator
# uses Gbarcode for encoding barcode data and then rmagick to generate
# images out of it for displaying in views.

# i was using clumsy file.new and file.close for eps generation, but 
# Adam Feuer had published a much elegant way by using IO.pipe for doing
# same thing. (never occured to me !! :-P )

# this way we can generate any barcode type which Gbarcode -> Gnome Barcode project
# supports.

# Extending <tt>ActionView::Base</tt> to support rendering themes

module ActionView
   
   # Extending <tt>ActionView::Base</tt> to support rendering themes
   class Base
    def barcode(id, options = {:encoding_format => DEFAULT_ENCODING })
      id.upcase!
      normalized_id = ASTERISKIZE ? "*#{id}*" : id

      #generate the barcode object 
      options[:encoding_format] = DEFAULT_ENCODING unless options[:encoding_format]
      bc = Gbarcode.barcode_create(normalized_id)
      bc.width  = options[:width]          if options[:width]
      bc.height = options[:height]         if options[:height]
      bc.scalef = options[:scaling_factor] if options[:scaling_factor]
      bc.xoff   = options[:xoff]           if options[:xoff]
      bc.yoff   = options[:yoff]           if options[:yoff]
      bc.margin = options[:margin]         if options[:margin]
      
      #encode the barcode object in desired format
      Gbarcode.barcode_encode(bc, options[:encoding_format])
      read_pipe, write_pipe  = IO.pipe
      Gbarcode.barcode_print(bc, write_pipe, Gbarcode::BARCODE_OUT_EPS)
      write_pipe.close()
      #convert the eps to png image with help of rmagick
      eps = read_pipe.read()
      im = Magick::Image::read_inline(Base64.b64encode(eps)).first
      im.format = DEFAULT_FORMAT
      #block ensures that the file is closed after write operation
      File.open("#{RAILS_ROOT}/public/images/barcodes/#{id}.png",'w') do |image|
        im.write(image)  
      end
      return image_tag("barcodes/#{id}.png")
    end
   end
end
