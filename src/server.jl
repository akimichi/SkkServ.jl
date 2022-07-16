#!/opt/julia/bin/julia

#=
    ソケットサーバ
    1:1 のコネクションを複数接続可
    Todo : シグナル見て停止とかタイムアウトとかサーバらしい実装が必要
=#

import Redis
# ソケットを準備
using Sockets
# using SkkServ

function server(redisConnection) 
 
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
              request = readline(socket, keep=true)
              command = request[1],
              midashi = strip(request[2])
              println(command)
              if command == '0' # 接続切断
                close(socket)
                exit()
              elseif command == '1' # 変換結果を返す
                response = get(connection, request)
                if response
                  write(socket, response)
                else 
                  write(socket, "$(request)\n")
                end
              elseif command == '2' # サーバーのバージョンを返す
                write(socket, "SkkServ.0.1.0")
              elseif command == '3' # サーバーのホスト名とアドレスを返す
                write(socket, "$(gethostname()):$(port)")
              elseif command == '4' # サーバーから補完された見出し候補一覧を返す
                write(socket, "4$(request[1:end])\n")
              else
                throw("unknown request: $(request)")
              end

          catch err
            println("エラーです")
            println(err)
            exit()
          end
        end
    end
  end
end
