require 'oystercard'

describe Oystercard do 

	subject(:card) { described_class.new }


	it 'should create a card that has a balance' do 
		expect(subject.balance).to eq(0)
	end

	it 'should top up the balance with the amount given' do
		card.top_up(5)
		expect(card.balance).to eq(5)
	end

	it 'should raise an error if the new balance exceeds the limit' do
		card.top_up Oystercard::MAX_BALANCE
		expect{ card.top_up(1) }.to raise_error "Limit exceeded: The limit is #{Oystercard::MAX_BALANCE}" 
	end

	it 'should deduct the cost of the journey from existing balance' do 
		card.top_up(10)
		expect{ card.deduct(5) }.to change{ card.balance }.by -5
	end

end
