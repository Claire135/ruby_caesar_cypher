require '../caeser_cypher'

describe CaeserCypher do

    describe '#run_caeser_cypher' do
        # Public Script Method -> No test necessary
    end

    describe '#create_number_array' do
        it 'returns an array of numbers mapped from ordinal values of string' do
            ordinal_lowercase = described_class.new('you are a monkey', 4)
            number_array = [121, 111, 117, 32, 97, 114, 101, 32, 97, 32, 109, 111, 110, 107, 101, 121]
            expect(ordinal_lowercase.send(:create_number_array)).to eq(number_array)
        end

        it 'returns an array of numbers mapped from ordinal values of string including uppercase' do
            ordinal_with_uppercase = described_class.new('Hello Zebra', 4)
            number_array = [72, 101, 108, 108, 111, 32, 90, 101, 98, 114, 97]
            expect(ordinal_with_uppercase.send(:create_number_array)).to eq(number_array)     
        end

        it 'returns an array of numbers mapped from ordinal values of string including symbols' do
            ordinal_with_symbols = described_class.new("Wow! Are you sure it's hers?", 4)
            number_array = [87, 111, 119, 33, 32, 65, 114, 101, 32, 121, 111, 117, 32, 115, 117, 114, 101, 32, 105, 116, 39, 115, 32, 104, 101, 114, 115, 63]
            expect(ordinal_with_symbols.send(:create_number_array)).to eq(number_array)
        end
    end


    describe '#create_switch' do

        it 'returns an array of numbers, 4 away from the original string' do
            switch_4 = described_class.new('I am a cat', 4)
            number_array = switch_4.send(:create_number_array)
            shifted_array = [77, 32, 101, 113, 32, 101, 32, 103, 101, 120]
            expect(switch_4.send(:create_switch, number_array, 4)).to eq(shifted_array)
        end

        it 'returns an array of numbers, 26 away from the original string, looping back to a when necessary' do
            switch_26 = described_class.new('I am a cat', 26)
            number_array = switch_26.send(:create_number_array)
            shifted_array = [73, 32, 97, 109, 32, 97, 32, 99, 97, 116]
            expect(switch_26.send(:create_switch, number_array, 26)).to eq(shifted_array)
        end

        it 'returns an array of numbers -4 away from the original string' do
            switch_reverse = described_class.new('I am a cat', -4)
            number_array = switch_reverse.send(:create_number_array)
            shifted_array = [69, 32, 119, 105, 32, 119, 32, 121, 119, 112]
            expect(switch_reverse.send(:create_switch, number_array, -4)).to eq(shifted_array)
        end

        it 'returns an array of numbers 4 away from the original string, leaving symbols as they are' do
            switch_symbols = described_class.new("I'm a cat?!?", 4)
            number_array = switch_symbols.send(:create_number_array)
            shifted_array = [77, 39, 113, 32, 101, 32, 103, 101, 120, 63, 33, 63]
            expect(switch_symbols.send(:create_switch, number_array, 4)).to eq(shifted_array)
        end
    end
    

    describe '#encode_message' do
        it 'returns a string with letters mapped from unicode array' do
            encode_4 = described_class.new('I am a cat', -4)
            encode_4.run_caeser_cypher
            expect(encode_4.send(:encode_message)).to eq('E wi w ywp')

        end

        it 'returns an array of numbers 4 away from the original string, leaving symbols as they are' do
            encode_symbols = described_class.new("I'm a cat?!?", 4)
            encode_symbols.run_caeser_cypher
            expect(encode_symbols.send(:encode_message)).to eq("M'q e gex?!?")
        end
    end

    describe '#print_encoded_message' do
        #unnecessary - puts statement
    end
end
