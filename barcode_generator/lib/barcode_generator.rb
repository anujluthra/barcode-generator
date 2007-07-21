# BarcodeGenerator

# Extending <tt>ActionView::Base</tt> to support rendering themes

module ActionView
   
   # Extending <tt>ActionView::Base</tt> to support rendering themes
   class Base
    def barcode id
      id.upcase!
      normalized_id = ASTERISKIZE ? "*#{id}*" : id
      canvas = Magick::ImageList.new
      canvas.new_image(BARCODE_COLUMNS, BARCODE_ROWS)      
      text = Magick::Draw.new
      text.font = ("#{RAILS_ROOT}/public/fonts/FRE3OF9X.TTF")
      text.pointsize = BARCODE_POINTSIZE
      text.fill = BARCODE_COLOR
      text.gravity = Magick::CenterGravity      
      text.annotate(canvas, 0,0,2,2, normalized_id)      
      canvas.write("#{RAILS_ROOT}/public/images/barcodes/#{id}.png")
      return image_tag("barcodes/#{id}.png")
    end
   end
end
