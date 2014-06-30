require './lib/tree_parser'

describe TreeParser do

  it 'can parse employees for their management hierarchies' do
    data = <<-DATA
    Izaiah Deckow
      Joel Corkery
        Della Schuppe
        Lurline Ankunding
      Aaliyah Wolff
        Elisa Adams
    Eulalia Bode
      Claude McCullough
        Lowell Hettinger
    DATA
    tree_parser = TreeParser.new(data)
    expect(tree_parser.parse).to eq({
                                      "Izaiah Deckow" => nil,
                                      "Joel Corkery" => "Izaiah Deckow",
                                      "Della Schuppe" => "Joel Corkery",
                                      "Lurline Ankunding" => "Joel Corkery",
                                      "Aaliyah Wolff" => "Izaiah Deckow",
                                      "Elisa Adams" => "Aaliyah Wolff",
                                      "Eulalia Bode" => nil,
                                      "Claude McCullough" => "Eulalia Bode",
                                      "Lowell Hettinger" => "Claude McCullough",
                                    })
  end

end