#!/opt/julia/bin/julia



function loadDictionary(filepath::String)

  open(filepath, "r") do file
    for line in eachline(file)
      println( line )
    end 
　end
end


