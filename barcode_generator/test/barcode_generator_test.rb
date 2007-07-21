require 'test/unit'

class BarcodeGeneratorTest < Test::Unit::TestCase
  # Replace this with your real tests.

	def test_can_read_font_file
		assert File.exists?("#{RAILS_ROOT}/public/fonts/FRE3OF9X.TTF"), 'could not locate font file. Please run the rake task barcode_setup'
	end

	def test_can_create_barcode_image
		image_path = ActionView::Base.barcode('test')
		assert File.exists?("#{RAILS_ROOT}/public/images/#{image_path}"),  'barcode not generated'
	end
end
