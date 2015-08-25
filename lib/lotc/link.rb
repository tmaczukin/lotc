module LOTC
  # Link class
  #
  class Link
    attr_reader :container
    attr_reader :wait_for

    def initialize(container, wait_for = nil)
      @container = container
      @wait_for = wait_for
    end
  end
end
