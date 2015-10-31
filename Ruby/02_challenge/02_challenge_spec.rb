describe 'button_presses' do
  it 'counts the number of pressed buttons' do
    expect(button_presses('nvm')).to eq 6
    expect(button_presses('WHERE DO U WANT 2 MEET L8R')).to eq 47
    expect(button_presses(' 19*YrS 00#Ho5')).to eq 33
    expect(button_presses('1234567890 *#')).to eq 40
  end
end
