#!/opt/julia/bin/julia

#=
    ソケットサーバ
    1:1 のコネクションを複数接続可
    Todo : シグナル見て停止とかタイムアウトとかサーバらしい実装が必要
=#

# ソケットを準備
using Sockets
# using SkkServ

function server(port) 
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
            write(socket, readline(socket, keep=true))
        catch err
          println("エラーです")
          println(err)
          exit()
        end
      end
  end
end
