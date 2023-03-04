@testset "esg_scores" begin
    @test !isempty(esg_scores(fmp, "AAPL")[1])
end

@testset "esg_ratings" begin
    @test !isempty(esg_ratings(fmp, "AAPL")[1])
end

@testset "esg_score_benchmarks" begin
    @test !isempty(esg_score_benchmarks(fmp, 2022)[1])
end