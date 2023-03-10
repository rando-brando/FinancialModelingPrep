@testset "price_quote" begin
    @test isa(price_quote(fmp, "SPY"), JSONTable)
    @test_throws PermissionError isa(price_quote(fmp, "%5EGSPC"), JSONTable)
    @test_throws PermissionError isa(price_quote(fmp, "EDF.PA"), JSONTable)
    @test_throws PermissionError isa(price_quote(fmp, "FNV.TO"), JSONTable)
    @test isa(price_quote(fmp, "BTCUSD"), JSONTable)
    @test isa(price_quote(fmp, "EURUSD"), JSONTable)
    @test isa(price_quote(fmp, "ZGUSD"), JSONTable)
end

@testset "price_quotes" begin
    @test_throws PermissionError isa(price_quotes(fmp, "index"), JSONTable)
    @test_throws PermissionError isa(price_quotes(fmp, "nyse"), JSONTable)
    @test_throws PermissionError isa(price_quotes(fmp, "euronext"), JSONTable)
    @test_throws PermissionError isa(price_quotes(fmp, "tsx"), JSONTable)
    @test_throws PermissionError isa(price_quotes(fmp, "crypto"), JSONTable)
    @test_throws PermissionError isa(price_quotes(fmp, "forex"), JSONTable)
    @test_throws PermissionError isa(price_quotes(fmp, "commodity"), JSONTable)
end

@testset "historical_price_quote" begin
    @test isa(historical_price_quote(fmp, "SPY", serietype = "line"), JSONTable)
    @test_throws PermissionError isa(historical_price_quote(fmp, "%5EGSPC"), JSONTable)
    @test_throws PermissionError isa(historical_price_quote(fmp, "EDF.PA"), JSONTable)
    @test_throws PermissionError isa(historical_price_quote(fmp, "FNV.TO"), JSONTable)
    @test isa(historical_price_quote(fmp, "BTCUSD", timeseries = 5), JSONTable)
    @test isa(historical_price_quote(fmp, "EURUSD", from = "2018-03-12", to = "2019-03-12"), JSONTable)
    @test isa(historical_price_quote(fmp, "ZGUSD", frequency = TIME_FREQUENCIES.hours1), JSONTable)
end
