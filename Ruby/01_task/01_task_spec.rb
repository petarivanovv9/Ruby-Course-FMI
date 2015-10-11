describe '#convert_to_bgn' do
  it 'converts bgn' do
    expect(convert_to_bgn(1000, :bgn)).to eq 1000
  end
end

describe '#convert_to_bgn' do
  it 'converts usd' do
    expect(convert_to_bgn(1000, :usd)).to eq 1740.8
  end
end

describe '#convert_to_bgn' do
  it 'converts eur' do
    expect(convert_to_bgn(1000, :eur)).to eq 1955.7
  end
end

describe '#convert_to_bgn' do
  it 'converts gbp' do
    expect(convert_to_bgn(1000, :gbp)).to eq 2641.5
  end
end

describe '#convert_to_bgn' do
  it 'rounds to second sign after comma' do
    expect(convert_to_bgn(32, :usd)).to eq 55.71
  end
end

describe '#compare_prices' do
  it 'compares prices of the same currency' do
    expect(compare_prices(10, :usd, 13, :usd)).to be < 0
    expect(compare_prices(10, :eur, 10, :eur)).to eq 0
    expect(compare_prices(10, :gbp, 8, :gbp)).to be > 0
  end
end

describe '#compare_prices' do
  it 'compares prices of the different currency' do
    expect(compare_prices(10, :gbp, 13, :usd)).to be > 0
    expect(compare_prices(10, :bgn, 13, :usd)).to be < 0
    expect(compare_prices(10, :usd, 8.9, :eur)).to eq 0
  end
end
