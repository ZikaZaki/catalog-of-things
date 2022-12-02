require './lib/classes/label'
require './lib/classes/book'

describe Book do
    let(:book) { Book.new(publish_date: '2019-01-01', publisher: 'Zika Press', cover_state: 'good') }
    
    it 'should have a publish_date' do
        expect(book.publish_date.strftime('%Y-%m-%d')).to eq('2019-01-01')
    end
    
    it 'should have an archived status' do
        expect(book.archived).to eq(false)
    end
    
    it 'should have a label that is equalls nill' do
        expect(book.label).to eq(nil)
    end

    it 'should have a label that is not nill' do
        label = Label.new(title: 'Final Words', color: 'red')
        book.label = label
        expect(book.label).to eq(label)
    end
end
