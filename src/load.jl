#!/opt/julia/bin/julia

using Redis

function loadDictionary(redisConnection)
  function (filepath::String, user = "system")
    # connection = RedisConnection(host="broker.local") # host=127.0.0.1, port=6379, db=0, no password
    # connection = RedisConnection() # host=127.0.0.1, port=6379, db=0, no password


    open(filepath, "r") do file
      for line in eachline(file)
        entries = split(line)
        midashi = entries[1]
        println( entries)
        if startswith(entries[1], ";;") 
          println(";;")
        else
          hmset(redisConnection, user, Dict(midashi => entries[2], "dictionary" => basename(filepath)))
          # set(redisConnection, entries[1], entries[2])
        end 
      end 
  　end
    disconnect(redisConnection)
  end
end

