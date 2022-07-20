using MyLocalTest
using Documenter

DocMeta.setdocmeta!(MyLocalTest, :DocTestSetup, :(using MyLocalTest); recursive=true)

makedocs(;
    modules=[MyLocalTest],
    authors="Jianshu Jie",
    repo="https://github.com/jsjie/MyLocalTest.jl/blob/{commit}{path}#{line}",
    sitename="MyLocalTest.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://jsjie.github.io/MyLocalTest.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/jsjie/MyLocalTest.jl",
    devbranch="main",
)
