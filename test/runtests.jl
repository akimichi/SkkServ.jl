using SkkServ
using Test

@testset "SkkServ.jl" begin
  @testset "entry" begin
      line = "1a \n"
      @test line == "1a \n"
      tuple = entry(line)
      @test tuple.command == '1'
  end
end
