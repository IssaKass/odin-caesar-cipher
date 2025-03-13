require 'rspec'
require_relative '../caesar_cipher'

RSpec.describe 'Caesar Cipher' do
  it 'shifts letters correctly within bounds' do
    expect(caesar_cipher('HELLO', 3)).to eq('KHOOR')
    expect(caesar_cipher('Apple', 5)).to eq('Fuuqj')
  end

  it 'wraps around when exceeding Z or z' do
    expect(caesar_cipher('XYZ', 3)).to eq('ABC')
    expect(caesar_cipher('ABC', -3)).to eq('XYZ')
  end

  it 'handles no shift correctly' do
    expect(caesar_cipher('SAME', 0)).to eq('SAME')
  end

  it 'handles full rotation (26) correctly' do
    expect(caesar_cipher('ROTATE', 26)).to eq('ROTATE')
  end

  it 'retains non-alphabetic characters' do
    expect(caesar_cipher('Hello, World!', 5)).to eq('Mjqqt, Btwqi!')
  end

  it 'handles negative shifts correctly' do
    expect(caesar_cipher('HELLO', -5)).to eq('CZGGJ')
    expect(caesar_cipher('ZEBRA', -5)).to eq('UZWMV')
    expect(caesar_cipher('Zebra123', -3)).to eq('Wbyox123')
  end

  it 'handles shifting with large numbers correctly' do
    expect(caesar_cipher('HELLO', 29)).to eq('KHOOR')
    expect(caesar_cipher('Apple', 56)).to eq('Ettpi')
  end

  it 'handles mixed case input correctly' do
    expect(caesar_cipher('HeLlO', 3)).to eq('KhOoR')
    expect(caesar_cipher('wOrLd', -3)).to eq('tLoIa')
  end

  it 'returns empty string when given an empty input' do
    expect(caesar_cipher('', 5)).to eq('')
  end
end
