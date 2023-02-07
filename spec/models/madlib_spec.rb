require "rails_helper"

RSpec.describe 'Madlib', type: :model do
    context 'with a new Madlib with a mocked adjective, noun, and verb' do
        before(:each) do
            adjective = "yellow"
            noun = "store"
            verb = "run"

            allow_any_instance_of(Madlib).to receive(:get_adjective).and_return(adjective)
            allow_any_instance_of(Madlib).to receive(:get_noun).and_return(noun)
            allow_any_instance_of(Madlib).to receive(:get_verb).and_return(verb)

            @ml = Madlib.new
            @expected_madlib = "It was a #{@adjective} day. I went downstairs to see if I could #{@verb} dinner. I asked, \"Does the stew need fresh #{@noun}?\""
        end

        it 'receives the expected madlib' do
            expect(@ml.madlib).to eq(@expected_madlib)
        end

        it 'has no error' do
            expect(@ml.error).to be_nil
        end
    end

    context 'with a madlib that encounters an error'
end
