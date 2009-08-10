require 'test/unit'
require 'rubygems'
require 'action_controller'
require 'action_controller/test_process'
require 'active_support'
require 'action_view/helpers'
require 'action_view/test_case'
require File.dirname(__FILE__) + '/../lib/barcode_generator'

class BarcodeGeneratorTest < ActionView::TestCase

  def setup
    ActionController::Routing::Routes.draw do |map|
      map.connect ':controller/:action/:id'
    end
  end
  
  def test_can_create_barcode_image
    assert(true)
  end

  def test_invalid_options_not_allowed
    assert_raises(ArgumentError) {
      av_instance = ActionView::Base.new
      av_instance.barcode("id", { :noexistent_key => true })
    }
  end  


end
