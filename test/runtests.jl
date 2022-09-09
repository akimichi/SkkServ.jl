using SkkServ
using Test

@testset "SkkServ.jl" begin
  @testset "entry 1a" begin
      line = "1a \n"
      tuple = entry(line)
      @test tuple.command == '1'
      @test tuple.midashi == "a"
  end
  @testset "entry 1わ" begin
      line = "1わ \n"
      tuple = entry(line)
      @test tuple.command == '1'
      @test tuple.midashi == "わ"
  end
end
