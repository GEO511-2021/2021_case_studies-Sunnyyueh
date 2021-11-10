Resource
================
Yun Yueh (Sunny)
11/10/2021

# RTstudio

## Why is it useful?

## Why is it important?

## The author

## Example

``` r
library(TSstudio)
```

### Start with creating a time series data

#### Data

``` r
data("AirPassengers")
AirPassengers
```

    ##      Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
    ## 1949 112 118 132 129 121 135 148 148 136 119 104 118
    ## 1950 115 126 141 135 125 149 170 170 158 133 114 140
    ## 1951 145 150 178 163 172 178 199 199 184 162 146 166
    ## 1952 171 180 193 181 183 218 230 242 209 191 172 194
    ## 1953 196 196 236 235 229 243 264 272 237 211 180 201
    ## 1954 204 188 235 227 234 264 302 293 259 229 203 229
    ## 1955 242 233 267 269 270 315 364 347 312 274 237 278
    ## 1956 284 277 317 313 318 374 413 405 355 306 271 306
    ## 1957 315 301 356 348 355 422 465 467 404 347 305 336
    ## 1958 340 318 362 348 363 435 491 505 404 359 310 337
    ## 1959 360 342 406 396 420 472 548 559 463 407 362 405
    ## 1960 417 391 419 461 472 535 622 606 508 461 390 432

#### Ploting the data

``` r
ts_plot(AirPassengers, Xtitle = "Month", Ytitle = "Value", slider = T)
```

![](Resource_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

#### Decomposing the series

``` r
ts_decompose(AirPassengers)
```

![](Resource_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

#### Seasonal analysis

``` r
ts_seasonal(AirPassengers, type = "all")
```

![](Resource_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

``` r
ts_heatmap(AirPassengers)
```

![](Resource_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

``` r
ts_surface(AirPassengers)
```

![](Resource_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->