
function entry(line)
  command = line[1]
  midashi = strip(line[2:end])
  # midashi = strip(line[2:end], [' ','\n'])
  return (command = command, midashi = midashi) 
end
