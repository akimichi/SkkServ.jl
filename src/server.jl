#!/opt/julia/bin/julia

#=
    ソケットサーバ
    1:1 のコネクションを複数接続可
    Todo : シグナル見て停止とかタイムアウトとかサーバらしい実装が必要
=#

import Redis
# ソケットを準備
using Sockets
using StringEncodings



function server(redisConnection) 

  function receiveLine(socket) {
    
    character = read(socket, UInt8)
    # convert(Char, character)
    decode(bytes, "UTF-8")
  }


  function(port)
    connection = listen(IPv4(0),port)

    # 無限ループさせる
    while true
        # 接続待ち
        socket = accept(connection)
        # 接続が来たら、@asyncでコルーチン生成
        # 接続をコピー
        # peer = socket
        @async while isopen(socket)
            try
              # 接続をコピー
              # peer = socket
              # リクエスト読込
              # line = readline(socket)
              line = readline(socket, keep=true)
              tuple = entry(line)
              # command = line[1],
              println(tuple)
              if tuple.command == '0' # 接続切断
                close(socket)
                exit()
              elseif tuple.command == '1' # 変換結果を返す
                println(midashi)
                response = get(redisConnection, tuple.midashi)
                println(response)
                # write(socket, response)
                if response
                  write(socket, response)
                else 
                  write(socket, "$(line)\n")
                end
              elseif tuple.command == '2' # サーバーのバージョンを返す
                write(socket, "SkkServ.0.1.0")
              elseif tuple.command == '3' # サーバーのホスト名とアドレスを返す
                write(socket, "$(gethostname()):$(port)")
              elseif tuple.command == '4' # サーバーから補完された見出し候補一覧を返す
                write(socket, "4$(line[1:end])\n")
              else
                throw("unknown request: $(line)")
              end

          catch err
            println("エラーです")
            println(err)
            # exit()
          end
        end
    end
  end
end
