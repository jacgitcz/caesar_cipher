require_relative "../caesar_cipher"

describe "caesar_cipher" do
  it "returns unciphered text with offset = 0" do
     expect(caesar_cipher("abc",0)).to eq "abc"
  end
  it "ciphers mixed case text for various offsets" do
     expect(caesar_cipher("abc",1)).to eq "bcd"
     expect(caesar_cipher("AazZ",1)).to eq "BbaA"
     expect(caesar_cipher("AbCqRwxYz",7)).to eq "HiJxYdeFg"
  end
  it "copies non-alpha (whitespace, numbers etc) unchanged" do
     expect(caesar_cipher("123   456!?.",9)).to eq "123   456!?."
     expect(caesar_cipher("John1:1 In!", 10)).to eq "Tyrx1:1 Sx!"
  end
  it "handles negative offsets" do
     expect(caesar_cipher("abc",-2)).to eq "yza"
     expect(caesar_cipher("AaNnZz",-27)).to eq "ZzMmYy"
  end
  it "ciphers a typical sentence" do
     expect(caesar_cipher("What a beautiful sentence!",11)).to eq "Hsle l mplfetqfw dpyepynp!"
  end
end

