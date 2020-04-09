
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dockerstats

<!-- badges: start -->

<!-- badges: end -->

`{dockerstats}` is a small wrapper around `docker stats` that returns
the output of this command as an R data.frame.

Note that this package calls `system("docker stats")` so you should be
able to do this from your R command line. I’ll probably refactor that at
some point.

## Installation

You can install the released version of `{dockerstats}` from GitHubwith:

``` r
remotes:install_github("ColinFay/dockerstats")
```

## How to

``` r
library(dockerstats)
```

### dockerstats()

By default, `dockerstats()` returns the stats for running containers.

``` r
dockerstats()
#>      Container               Name
#> 1 d74bd9004627     exciting_yalow
#> 2 7f3b0a08a7aa stupefied_ishizaka
#> 3 ca323ae39e42              proxy
#> 4 1c32d35562fb         rocketchat
#> 5 9e9605a015d4              mongo
#>                                                                 ID CPUPerc
#> 1 d74bd9004627efa518ea0fe669434fa6ccd2f86491e39311c9211bfb860839e2    0.00
#> 2 7f3b0a08a7aa502657d0d5459f9cd412f0399825f8e15262bf47fe0cd4cc825d    0.00
#> 3 ca323ae39e42d898417b019b2bf7f06feaf877d248cd71b9cad8eebc3f5e1126    0.00
#> 4 1c32d35562fbd442c75e132e4075f379fc2097293a1ab0b5361debf2d4ab74cb    0.44
#> 5 9e9605a015d4378283947ed16f547a8272039ec853b4962010203204d2c05167    1.73
#>   MemUsage MemLimit MemPerc   NetI   NetO BlockI BlockO PIDs
#> 1   492KiB 1.943GiB    0.02 2.37kB     0B     0B     0B    1
#> 2   516KiB 1.943GiB    0.03 3.37kB     0B     0B     0B    1
#> 3 13.87MiB 1.943GiB    0.70 9.05kB 3.22kB     0B     0B   11
#> 4 241.6MiB 1.943GiB   12.14 34.8MB 27.8MB     0B     0B   12
#> 5  17.7MiB 1.943GiB    0.89 27.8MB 34.7MB     0B     0B   54
#>           record_time
#> 1 2020-04-09 16:17:28
#> 2 2020-04-09 16:17:28
#> 3 2020-04-09 16:17:28
#> 4 2020-04-09 16:17:28
#> 5 2020-04-09 16:17:28
```

You can return stats for all containers (not just running)

``` r
dockerstats(all = TRUE)
#>       Container                    Name
#> 1  ea890803de3c           sleepy_colden
#> 2  5cef479fec0e           boring_swartz
#> 3  658ed62c82ed            elegant_pare
#> 4  d74bd9004627          exciting_yalow
#> 5  f5cb6430e103      gallant_lichterman
#> 6  f8c3f4b47931 heuristic_proskuriakova
#> 7  1a8588105357          pedantic_booth
#> 8  7c16ac79e629           focused_chaum
#> 9  e2f0dc1dab14           boring_liskov
#> 10 7f3b0a08a7aa      stupefied_ishizaka
#> 11 194f087c356e       boring_mcclintock
#> 12 7f575179ad72       flamboyant_sammet
#> 13 82b75a1bdbe8                    jack
#> 14 5b1197c61bfb                   login
#> 15 ca323ae39e42                   proxy
#> 16 1c32d35562fb              rocketchat
#> 17 9e9605a015d4                   mongo
#>                                                                  ID CPUPerc
#> 1  ea890803de3c6bf430c39b4c9e03ae79f18a01f453fe6794ca2d02882c2f905b    0.00
#> 2  5cef479fec0e5a8ab1b8940364ff4779e4abb2adfd2a9f8dbe1f6f470cb5d9c1    0.00
#> 3  658ed62c82edbb32979c2adac7ad75ce65b41bfb7044758e34c79d45804a6f31    0.00
#> 4  d74bd9004627efa518ea0fe669434fa6ccd2f86491e39311c9211bfb860839e2    0.00
#> 5  f5cb6430e103fc3c0e57942e8a96f84ffc55f4006cd089e1be5a82bfec808935    0.00
#> 6  f8c3f4b4793146069b336db2ec8d96732920eac759991138ba0695d05a8e2de6    0.00
#> 7  1a8588105357e77d1e284615d7461a259c41f654c5db66e3b8964fa5395a4d65    0.00
#> 8  7c16ac79e629e7d74137840876561733614aea265c4876c360160cd258e85d5f    0.00
#> 9  e2f0dc1dab146b1b0418f3cd620fdaa0ba40645aa822b10261e8ba221499aaa2    0.00
#> 10 7f3b0a08a7aa502657d0d5459f9cd412f0399825f8e15262bf47fe0cd4cc825d    0.00
#> 11 194f087c356e992778f8ddac61eeb4e4e107caee43af8c1d8072e6aad425f97a    0.00
#> 12 7f575179ad72079840887cd52ad0fe5a97313d4864414e35660c8740265351ff    0.00
#> 13 82b75a1bdbe8ce1750210646c02a4dd24c0113c162de2f58d6534c0b25e8b2f0    0.00
#> 14 5b1197c61bfba9614ccea0c69f9ae048e44e85ac0e64f36f240bc9220f962f5d    0.00
#> 15 ca323ae39e42d898417b019b2bf7f06feaf877d248cd71b9cad8eebc3f5e1126    0.00
#> 16 1c32d35562fbd442c75e132e4075f379fc2097293a1ab0b5361debf2d4ab74cb    0.11
#> 17 9e9605a015d4378283947ed16f547a8272039ec853b4962010203204d2c05167    1.41
#>    MemUsage MemLimit MemPerc   NetI   NetO BlockI BlockO PIDs
#> 1        0B       0B    0.00     0B     0B     0B     0B    0
#> 2        0B       0B    0.00     0B     0B     0B     0B    0
#> 3        0B       0B    0.00     0B     0B     0B     0B    0
#> 4    492KiB 1.943GiB    0.02 2.37kB     0B     0B     0B    1
#> 5        0B       0B    0.00     0B     0B     0B     0B    0
#> 6        0B       0B    0.00     0B     0B     0B     0B    0
#> 7        0B       0B    0.00     0B     0B     0B     0B    0
#> 8        0B       0B    0.00     0B     0B     0B     0B    0
#> 9        0B       0B    0.00     0B     0B     0B     0B    0
#> 10   516KiB 1.943GiB    0.03 3.37kB     0B     0B     0B    1
#> 11       0B       0B    0.00     0B     0B     0B     0B    0
#> 12       0B       0B    0.00     0B     0B     0B     0B    0
#> 13       0B       0B    0.00     0B     0B     0B     0B    0
#> 14       0B       0B    0.00     0B     0B     0B     0B    0
#> 15 13.87MiB 1.943GiB    0.70 9.05kB 3.22kB     0B     0B   11
#> 16 241.7MiB 1.943GiB   12.15 34.8MB 27.8MB     0B     0B   12
#> 17  17.7MiB 1.943GiB    0.89 27.8MB 34.7MB     0B     0B   54
#>            record_time
#> 1  2020-04-09 16:17:30
#> 2  2020-04-09 16:17:30
#> 3  2020-04-09 16:17:30
#> 4  2020-04-09 16:17:30
#> 5  2020-04-09 16:17:30
#> 6  2020-04-09 16:17:30
#> 7  2020-04-09 16:17:30
#> 8  2020-04-09 16:17:30
#> 9  2020-04-09 16:17:30
#> 10 2020-04-09 16:17:30
#> 11 2020-04-09 16:17:30
#> 12 2020-04-09 16:17:30
#> 13 2020-04-09 16:17:30
#> 14 2020-04-09 16:17:30
#> 15 2020-04-09 16:17:30
#> 16 2020-04-09 16:17:30
#> 17 2020-04-09 16:17:30
```

Or from a subset of containers:

``` r
dockerstats("mongo", "proxy")
#>   Container  Name
#> 1     mongo mongo
#> 2     proxy proxy
#>                                                                 ID CPUPerc
#> 1 9e9605a015d4378283947ed16f547a8272039ec853b4962010203204d2c05167    2.02
#> 2 ca323ae39e42d898417b019b2bf7f06feaf877d248cd71b9cad8eebc3f5e1126    0.00
#>   MemUsage MemLimit MemPerc   NetI   NetO BlockI BlockO PIDs
#> 1  17.7MiB 1.943GiB    0.89 27.8MB 34.7MB     0B     0B   54
#> 2 13.87MiB 1.943GiB    0.70 9.05kB 3.22kB     0B     0B   11
#>           record_time
#> 1 2020-04-09 16:17:33
#> 2 2020-04-09 16:17:33
```

### dockerstats\_recurse

`dockerstats_recurse()` is a wrapper around `dockerstats()` that runs
every `every` seconds, calling the `callback` function everytime a loop
is completed.

By default, the callback is `print`, but you can define your own. For
example, this function will run the `dockerstats()` fun every 2 seconds
and save it to a file.

``` r
dockerstats::dockerstats_recurse(
  "bloomdev",
  callback = function(res){
    print(res)
    write.table(res, "dockerstats.csv", append = TRUE, col.names = FALSE, row.names = FALSE, sep = ",")
  }
)
```

## How columns are transformed

  - `CPUPerc` and `MemPerc` are stripped from the trailing `%`, and are
    turned into numeric

  - `MEM USAGE / LIMIT` is splitted into two columns, `MemUsage` and
    \`MemLimit

  - `NET I/O` and `BLOCK I/O` are splitted into two columns,
    respectively `NetI` & `NetO`, and `BlockI` & `BlockO`
