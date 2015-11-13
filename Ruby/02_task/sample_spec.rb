describe '#move' do
  it 'moves snake right' do
    expect(move([[4, 5], [4, 6], [5, 6], [5, 7]], [0, 1])).
      to eq [[4, 6], [5, 6], [5, 7], [5, 8]]
  end
end

describe '#move' do
  it 'moves snake right' do
    expect(move([[4, 5], [4, 6], [5, 6], [5, 7]], [1, 0])).
      to eq [[4, 6], [5, 6], [5, 7], [6, 7]]
  end
end

describe '#grow' do
  it 'grow snake right' do
    expect(grow([[4, 6], [5, 6], [5, 7]], [1, 0])).
      to eq [[4, 6], [5, 6], [5, 7], [6, 7]]
  end
end

describe '#grow' do
  it 'grow snake right' do
    expect(grow([[4, 6], [5, 6], [5, 7]], [0, 1])).
      to eq [[4, 6], [5, 6], [5, 7], [5, 8]]
  end
end

describe '#new_food' do
  it 'generates new food' do
    expect(new_food([[0, 0], [0, 2], [1, 0], [2, 0], [1, 2]], [[0, 1], [1, 1], [1, 2], [2, 1]], {width: 3, height: 3})).
      to eq [2, 2]
  end
end

describe '#new_food' do
  it 'generates new food' do
    expect(new_food([[0, 0]], [[0, 1], [1, 1]], {width: 2, height: 2})).
      to eq [1, 0]
  end
end

describe '#obstacle_ahead?' do
  it 'returns true if wall in front of snake' do
    expect(obstacle_ahead?([[3, 8], [3, 9]], [0, 1], {width: 10, height: 10})).
      to eq true
  end
end

describe '#obstacle_ahead?' do
  it 'returns true if wall in front of snake' do
    expect(obstacle_ahead?([[3, 8], [3, 9]], [0, -1], {width: 10, height: 10})).
      to eq true
  end
end

describe '#obstacle_ahead?' do
  it 'returns true if wall in front of snake' do
    expect(obstacle_ahead?([[3, 8], [3, 9], [4, 9]], [1, 0], {width: 10, height: 10})).
      to eq false
  end
end

describe '#obstacle_ahead?' do
  it 'returns true if wall in front of snake' do
    expect(obstacle_ahead?([[7, 8], [8, 8], [9, 9]], [1, 0], {width: 10, height: 10})).
      to eq true
  end
end

describe '#danger?' do
  it 'returns true if position in front of snake is a wall' do
    expect(danger?([[3, 8], [3, 9]], [0, 1], {width: 10, height: 10})).to eq true
  end
end

describe '#danger?' do
  it 'returns true if position in front of snake is a wall' do
    expect(danger?([[3, 7], [3, 8]], [0, 1], {width: 10, height: 10})).to eq true
  end
end

describe '#danger?' do
  it 'returns true if position in front of snake is a wall' do
    expect(danger?([[3, 6], [3, 7]], [0, 1], {width: 10, height: 10})).to eq false
  end
end
