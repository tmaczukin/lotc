# LotcHelper module
#
module LotcHelper
  def full_manifest_example
    File.read(File.dirname(__FILE__) + '/lotcfile.example')
  end
end
