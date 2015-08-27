# LotcHelper module
#
module LotcHelper
  def example_basic_manifest
    <<-END
      add_image :test_image_1, 'test_image_1'
      add_image :test_image_2, 'test_image_2:v0.1'

      define_container :test_container_1 do
        image :test_image_1
      end

      define_container :test_container_2 do
        image :test_image_2
      end

      define_container :test_container_2_dev, :test_container_2
    END
  end

  def full_manifest_example
    File.read(File.dirname(__FILE__) + '/lotcfile.example')
  end
end
