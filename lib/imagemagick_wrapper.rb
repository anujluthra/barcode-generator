module ImageMagickWrapper
   # call imagemagick library on commandline thus bypassing RMagick
   # memory leak hasseles :)
   def convert_to_png(src, out)
     #more options : convert +antialias -density 150 eps png
     system("convert  #{src} #{out}")
   end
end