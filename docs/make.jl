using SkkServ
using Documenter

DocMeta.setdocmeta!(SkkServ, :DocTestSetup, :(using SkkServ); recursive=true)

makedocs(;
    modules=[SkkServ],
    authors="Akimichi Tatsukawa",
    repo="https://github.com/akimichi/SkkServ.jl/blob/{commit}{path}#{line}",
    sitename="SkkServ.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://akimichi.github.io/SkkServ.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/akimichi/SkkServ.jl",
    devbranch="main",
)
