module LOTC
  describe DSL::Container do
    subject do
      -> { LOTC::ContainerBuilder.create(@manifest, @parent_container, &@container_definition) }
    end

    before do
      manifest = <<-END
        add_image :test_image_1, 'test_image_1'
        add_image :test_image_2, 'test_image_2:v0.1'

        define_container :test_container_1 do
          image :test_image_1
        end
      END
      @manifest = LOTC::Manifest.new(manifest)

      @container_definition = Proc.new do
        image    :test_image_2
        volume   '/container/path', '/host/path'
        link     :linked_container, :test_container_1, /test/
        env      'SOME_ENV', 'example'
        cmd      'bash'
        tcp_port 80, 80, '127.0.0.2'
        udp_port 53, 53, '127.0.0.2'

        tty           true
        detach        true
        read_only     true
        interactive   true
      end
    end

    it 'should set image reference' do
      expect(subject.call.image).to equal(@manifest.images[:test_image_2])
    end

    it 'should raise error if referencing not added image' do
      @container_definition = Proc.new do
        image :non_existing_image
      end

      expect { subject.call }.to raise_error DSL::NotAddedImageError
    end

    it 'should set volume mapping' do
      container_builder = subject.call

      expect(container_builder.volumes).to have_key('/container/path')
      expect(container_builder.volumes['/container/path']).to eq('/host/path')
    end

    it 'should set link mapping' do
      container_builder = subject.call

      expect(container_builder.links).to have_key(:linked_container)
      expect(container_builder.links[:linked_container]).to be_a Link
      expect(container_builder.links[:linked_container].container).to eq(@manifest.containers[:test_container_1])
      expect(container_builder.links[:linked_container].wait_for).to eq(/test/)
    end

    it 'should set envs' do
      container_builder = subject.call

      expect(container_builder.envs).to have_key('SOME_ENV')
      expect(container_builder.envs['SOME_ENV']).to eq('example')
    end

    it 'should set cmd' do
      expect(subject.call.cmd).to eq('bash')
    end

    it 'should set flags' do
      container_builder = subject.call

      expect(container_builder.tty).to eq(true)
      expect(container_builder.detach).to eq(true)
      expect(container_builder.read_only).to eq(true)
      expect(container_builder.interactive).to eq(true)
    end

    it 'should set port mappings' do
      container_builder = subject.call

      expect(container_builder.ports[:tcp]).to have_key(80)
      expect(container_builder.ports[:udp]).to have_key(53)

      expect(container_builder.ports[:tcp][80]).to eq({port: 80, addr: '127.0.0.2'})
      expect(container_builder.ports[:udp][53]).to eq({port: 53, addr: '127.0.0.2'})
    end

    it 'should clone parent container if set' do
      @parent_container = :test_container_1
      @container_definition = nil

      expect(subject.call).to eq(@manifest.containers[:test_container_1])
    end

    it 'should excend parent if definition is present' do
      @parent_container = :test_container_1
      @container_definition = Proc.new do
        image :test_image_2
      end

      expect(subject.call.image).to eq(@manifest.images[:test_image_2])
    end
  end
end
