require 'spec_helper'

describe Mutant::Mutator::Call, '.each' do
  context 'send without arguments' do
    context 'to self' do

      context 'implict' do
        let(:source) { 'foo' }

        let(:mutations) do
          mutations = []
          mutations << 'self.foo' # without explict receiver (not send privately)
        end

        it_should_behave_like 'a mutation enumerator method'
      end

      context 'explict' do
        let(:source) { 'self.foo' }

        it_should_behave_like 'a noop mutation enumerator method'
      end
    end
  end

  pending 'send with arguments' do
    context 'to self' do
      context 'implict' do
        let(:source) { 'foo(1)' }

        let(:mutations) do
          mutations = []
        end

        it_should_behave_like 'a mutation enumerator method'
      end

      context 'explict' do
        let(:source) { 'self.foo(1)' }

        let(:mutations) do
          mutations = []
          mutations << 'foo(1)' # without explict receiver (send privately)
        end

        it_should_behave_like 'a mutation enumerator method'
      end
    end
  end
end