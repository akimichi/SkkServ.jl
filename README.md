# SkkServ

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://akimichi.github.io/SkkServ.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://akimichi.github.io/SkkServ.jl/dev/)
[![Build Status](https://travis-ci.com/akimichi/SkkServ.jl.svg?branch=main)](https://travis-ci.com/akimichi/SkkServ.jl)


## cli



~~~
> julia
> Pkg.import("https://github.com/akimichi/SkkServ.jl")
julia> using SkkServ
julia> using Redis
julia> connection = RedisConnection(host="broker.local") 
julia> load = loadDictionary(connection )
julia> load("./resource/SKK-JISYO.S")
~~~



