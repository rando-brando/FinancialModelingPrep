"""
    otc_quote(fmp, symbol)
    otc_quote(fmp, symbols)

Returns the price quote for the specified symbol(s). Each element is a dictionary.

# Arguments
- fmp::FMP: A Financial Modeling Prep instance.
- symbol::String: A stock symbol.
- symbols::Vector{String}: A vector of stock symbols.

See [OTC-Quote](https://site.financialmodelingprep.com/developer/docs/#Company-Quote) for more details.

# Examples
``` julia
# create a FMP API instance
fmp = FMP()

# get the otc quote for GBTC
data = otc_quote(fmp, "GBTC")

# get the otc quote for BATRB and FWONB
data = otc_quote(fmp, ["BATRB", "FWONB"])
```
"""
function otc_quote(fmp::FMP, symbol::String)::Vector{Any}
    endpoint = "otc/real-time-price/$(symbol)"
    url, query = Client.make_url_v3(fmp, endpoint)
    response = Client.make_get_request(url, query)
    data = Client.parse_json_response(response)
    return data
end

function otc_quote(fmp::FMP, symbols::Vector{String})::Vector{Any}
    endpoint = "otc/real-time-price/$(join(symbols, ','))"
    url, query = Client.make_url_v3(fmp, endpoint)
    response = Client.make_get_request(url, query)
    data = Client.parse_json_response(response)
    return data
end

"""
    price_change(fmp, symbol)
    price_change(fmp, symbols)

Returns the price change for the specified symbol(s). Each element is a dictionary.

# Arguments
- fmp::FMP: A Financial Modeling Prep instance.
- symbol::String: A stock symbol.
- symbols::Vector{String}: A vector of stock symbols.

See [Price-Change](https://site.financialmodelingprep.com/developer/docs/#Stock-price-change) for more details.

# Examples
``` julia
# create a FMP API instance
fmp = FMP()

# get the price change for AAPL
data = price_change(fmp, "AAPL")

# get the price change for MSFT and GOOG
data = price_change(fmp, ["MSFT", "GOOG"])
```
"""
function price_change(fmp::FMP, symbol::String)::Vector{Any}
    endpoint = "stock-price-change/$(symbol)"
    url, query = Client.make_url_v3(fmp, endpoint)
    response = Client.make_get_request(url, query)
    data = Client.parse_json_response(response)
    return data
end

function price_change(fmp::FMP, symbols::Vector{String})::Vector{Any}
    endpoint = "stock-price-change/$(join(symbols, ','))"
    url, query = Client.make_url_v3(fmp, endpoint)
    response = Client.make_get_request(url, query)
    data = Client.parse_json_response(response)
    return data
end

"""
    historical_splits(fmp, symbol)

Returns the historical stock splits for the specified symbol. Each element is a dictionary.

# Arguments
- fmp::FMP: A Financial Modeling Prep instance.
- symbol::String: A stock symbol.

See [Historical-Stock-Splits](https://site.financialmodelingprep.com/developer/docs/#Historical-Stock-Splits) for more details.

# Examples
``` julia
# create a FMP API instance
fmp = FMP()

# get the historical splits for AAPL
data = historical_splits(fmp, "AAPL")
```
"""
function historical_splits(fmp::FMP, symbol::String)::Vector{Any}
    endpoint = "historical-price-full/stock_split/$(symbol)"
    url, query = Client.make_url_v3(fmp, endpoint)
    response = Client.make_get_request(url, query)
    data = Client.parse_json_response(response)
    return data
end

"""
    survivorship_bias(fmp, symbol, date)

Returns the survivorship bias for the specified symbol. Each element is a dictionary.

# Arguments
- fmp::FMP: A Financial Modeling Prep instance.
- symbol::String: A stock symbol.
- date::String: A yyyy-mm-dd formatted date string.

See [Survivorship-Bias](https://site.financialmodelingprep.com/developer/docs/#Survivorship-Bias-Free-EOD) for more details.

# Examples
``` julia
# create a FMP API instance
fmp = FMP()

# get the survivorship bias for AAPL to Jan 3, 2012
data = survivorship_bias(fmp, "AAPL", "2012-01-03")
```
"""
function survivorship_bias(fmp::FMP, symbol::String, date::String)::Vector{Any}
    endpoint = "historical-price-full/$(symbol)/$(date)"
    url, query = Client.make_url_v4(fmp, endpoint)
    response = Client.make_get_request(url, query)
    data = Client.parse_json_response(response)
    return data
end

"""
    technical_indicators(fmp, symbol, frequency = TIME_FREQUENCIES.daily, period = 200, type = "SMA")

Returns the historical price quote for the specified symbol and frequency. Each element is a dictionary.

# Arguments
- fmp::FMP: A Financial Modeling Prep instance.
- symbol::String: A stock symbol.
- frequency::String: A time frequency.
- period::Integer: The indicator period.
- type::String: The indicator type.

See [Daily-Indicators](https://site.financialmodelingprep.com/developer/docs/#Daily-Indicators) for more details.
See [Intraday-Indicators](https://site.financialmodelingprep.com/developer/docs/#Intraday-Indicators) for more details.

# Examples
``` julia
# create a FMP API instance
fmp = FMP()

# get the daily 50 period SMA for AAPL
data = technical_indicators(fmp, "AAPL", period = 50)

# get the 15m 10 period WMA for AAPL
data = technical_indicators(fmp, "AAPL", TIME_FREQUENCIES.minutes15, period = 10, type = "WMA")
```
"""
function technical_indicators(fmp::FMP, symbol::String; frequency::String = TIME_FREQUENCIES.daily, period::Integer = 200, type::String = "SMA")::Vector{Any}
    if !(frequency in TIME_FREQUENCIES)
        error("Invalid frequency value. Allowed values are $(TIME_FREQUENCIES). Modify TIME_FREQUENCIES to override behavior.")
    end
    endpoint = "technical_indicator/$(frequency)/$(symbol)"
    url, query = Client.make_url_v3(fmp, endpoint, period = period, type = type)
    response = Client.make_get_request(url, query)
    data = Client.parse_json_response(response)
    return data
end