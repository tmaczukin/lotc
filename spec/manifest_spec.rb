module LOTC
  describe DSL::Manifest do
    subject do
      -> { LOTC::Manifest.new(@manifest_contents) }
    end

    before do
      @manifest_contents = example_basic_manifest
      @manifest = subject.call
    end

    it 'should load valid manifest content' do
      expect { subject.call }.to_not raise_error
    end

    it 'should raise error when manifest contents is not valid' do
      @manifest_contents = 'invalid_method_name'

      expect { subject.call }.to raise_error NameError
    end

    it 'should return list of added images' do
      expect(@manifest.images).to have_key(:test_image_1)
      expect(@manifest.images).to have_key(:test_image_2)
    end

    it 'should return list of ContainerBuilder for defined containers' do
      expect(@manifest.containers[:test_container_1]).to be_a ContainerBuilder
      expect(@manifest.containers).to have_key(:test_container_1)
      expect(@manifest.containers).to have_key(:test_container_2)
    end

    it 'should raise error when image name is used more than once' do
      @manifest_contents = <<-END
        add_image :test_image_1, 'test_image_1'
        add_image :test_image_1, 'test_image_2'
      END

      expect { subject.call }.to raise_error DSL::DuplicateImageNameError
    end

    it 'should raise error when container name is used more than once' do
      @manifest_contents = <<-END
        define_container :test_container_1
        define_container :test_container_1
      END

      expect { subject.call }.to raise_error DSL::DuplicateContainerNameError
    end
  end
end
