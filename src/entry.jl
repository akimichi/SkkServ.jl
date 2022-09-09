using StringEncodings

function entry(line)
  command = line[1]
  midashi = strip(String(line[2:end]))
  # midashi = decode(Vector{UInt8}(strip(line[2:end])), "UTF-8")
  # midashi = strip(line[2:end])
  # midashi = decode(strip(line[2:end]), "UTF-16")
  return (command = command, midashi = midashi) 
end
