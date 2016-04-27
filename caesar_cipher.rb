def caesar_cipher(cleartext, offset)
  codetext = ""

  do_cipher = true
  
  cleartext.each_char do |char|
     coded_char = encode(char,offset)
     codetext << coded_char
  end
  codetext
end

def encode(char, offset)
  do_encode = true
  case char
  when 'A'..'Z'
     basecode = 'A'.ord
     endcode = 'Z'.ord
     codelen = endcode - basecode + 1
  when 'a'..'z'
     basecode = 'a'.ord
     endcode = 'z'.ord
     codelen = endcode - basecode + 1
  else
     do_encode = false
  end
  if do_encode
    code_val = char.ord   
    newcode = code_val + (offset % codelen)
    if newcode > endcode
      newcode = ((newcode - basecode) % codelen) + basecode
    elsif newcode < basecode
      newcode = newcode + codelen
    end
    coded_char = newcode.chr
  else
    coded_char = char
  end
  coded_char
end
