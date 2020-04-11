
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

You can install the released version of `{dockerstats}` from GitHub
with:

``` r
remotes::install_github("ColinFay/dockerstats")
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
#> 1 7f3b0a08a7aa stupefied_ishizaka
#> 2 1c32d35562fb         rocketchat
#> 3 9e9605a015d4              mongo
#>                                                                 ID CPUPerc
#> 1 7f3b0a08a7aa502657d0d5459f9cd412f0399825f8e15262bf47fe0cd4cc825d    0.00
#> 2 1c32d35562fbd442c75e132e4075f379fc2097293a1ab0b5361debf2d4ab74cb    0.93
#> 3 9e9605a015d4378283947ed16f547a8272039ec853b4962010203204d2c05167    2.99
#>   MemUsage MemLimit MemPerc   NetI   NetO BlockI BlockO PIDs
#> 1   516KiB 1.943GiB    0.03 9.59kB     0B     0B     0B    1
#> 2 347.2MiB 1.943GiB   17.45  121MB 98.4MB     0B     0B   12
#> 3 21.32MiB 1.943GiB    1.07 98.3MB  120MB     0B     0B   55
#>           record_time extra
#> 1 2020-04-11 23:39:56      
#> 2 2020-04-11 23:39:56      
#> 3 2020-04-11 23:39:56
```

You can return stats for all containers (not just running)

``` r
dockerstats(all = TRUE)
#>       Container                    Name
#> 1  dbcf81982870   mystifying_hofstadter
#> 2  841be05ca06f           nice_einstein
#> 3  bdac8ae662bd           rocketchating
#> 4  ad640c7420ea     compassionate_ellis
#> 5  ea890803de3c           sleepy_colden
#> 6  5cef479fec0e           boring_swartz
#> 7  658ed62c82ed            elegant_pare
#> 8  d74bd9004627          exciting_yalow
#> 9  f5cb6430e103      gallant_lichterman
#> 10 f8c3f4b47931 heuristic_proskuriakova
#> 11 1a8588105357          pedantic_booth
#> 12 7c16ac79e629           focused_chaum
#> 13 e2f0dc1dab14           boring_liskov
#> 14 7f3b0a08a7aa      stupefied_ishizaka
#> 15 194f087c356e       boring_mcclintock
#> 16 7f575179ad72       flamboyant_sammet
#> 17 82b75a1bdbe8                    jack
#> 18 5b1197c61bfb                   login
#> 19 ca323ae39e42                   proxy
#> 20 1c32d35562fb              rocketchat
#> 21 9e9605a015d4                   mongo
#>                                                                  ID CPUPerc
#> 1  dbcf81982870c42b73534e3e1e41ad5871c0dcb3d4f9b4b8a97b71f4d1bd5eb2    0.00
#> 2  841be05ca06f9b96fce842e426fc2d23a5ce968c898bd401ddcd7057ae790ac7    0.00
#> 3  bdac8ae662bd5c4b647fad89b73c95a66f84406a07d9e1c4e0db5a0eff33ad6b    0.00
#> 4  ad640c7420ea021453866e974666b7337885220238dadd3b717fa42bc51f3b26    0.00
#> 5  ea890803de3c6bf430c39b4c9e03ae79f18a01f453fe6794ca2d02882c2f905b    0.00
#> 6  5cef479fec0e5a8ab1b8940364ff4779e4abb2adfd2a9f8dbe1f6f470cb5d9c1    0.00
#> 7  658ed62c82edbb32979c2adac7ad75ce65b41bfb7044758e34c79d45804a6f31    0.00
#> 8  d74bd9004627efa518ea0fe669434fa6ccd2f86491e39311c9211bfb860839e2    0.00
#> 9  f5cb6430e103fc3c0e57942e8a96f84ffc55f4006cd089e1be5a82bfec808935    0.00
#> 10 f8c3f4b4793146069b336db2ec8d96732920eac759991138ba0695d05a8e2de6    0.00
#> 11 1a8588105357e77d1e284615d7461a259c41f654c5db66e3b8964fa5395a4d65    0.00
#> 12 7c16ac79e629e7d74137840876561733614aea265c4876c360160cd258e85d5f    0.00
#> 13 e2f0dc1dab146b1b0418f3cd620fdaa0ba40645aa822b10261e8ba221499aaa2    0.00
#> 14 7f3b0a08a7aa502657d0d5459f9cd412f0399825f8e15262bf47fe0cd4cc825d    0.00
#> 15 194f087c356e992778f8ddac61eeb4e4e107caee43af8c1d8072e6aad425f97a    0.00
#> 16 7f575179ad72079840887cd52ad0fe5a97313d4864414e35660c8740265351ff    0.00
#> 17 82b75a1bdbe8ce1750210646c02a4dd24c0113c162de2f58d6534c0b25e8b2f0    0.00
#> 18 5b1197c61bfba9614ccea0c69f9ae048e44e85ac0e64f36f240bc9220f962f5d    0.00
#> 19 ca323ae39e42d898417b019b2bf7f06feaf877d248cd71b9cad8eebc3f5e1126    0.00
#> 20 1c32d35562fbd442c75e132e4075f379fc2097293a1ab0b5361debf2d4ab74cb    4.71
#> 21 9e9605a015d4378283947ed16f547a8272039ec853b4962010203204d2c05167    2.92
#>    MemUsage MemLimit MemPerc   NetI   NetO BlockI BlockO PIDs
#> 1        0B       0B    0.00     0B     0B     0B     0B    0
#> 2        0B       0B    0.00     0B     0B     0B     0B    0
#> 3        0B       0B    0.00     0B     0B     0B     0B    0
#> 4        0B       0B    0.00     0B     0B     0B     0B    0
#> 5        0B       0B    0.00     0B     0B     0B     0B    0
#> 6        0B       0B    0.00     0B     0B     0B     0B    0
#> 7        0B       0B    0.00     0B     0B     0B     0B    0
#> 8        0B       0B    0.00     0B     0B     0B     0B    0
#> 9        0B       0B    0.00     0B     0B     0B     0B    0
#> 10       0B       0B    0.00     0B     0B     0B     0B    0
#> 11       0B       0B    0.00     0B     0B     0B     0B    0
#> 12       0B       0B    0.00     0B     0B     0B     0B    0
#> 13       0B       0B    0.00     0B     0B     0B     0B    0
#> 14   516KiB 1.943GiB    0.03 9.59kB     0B     0B     0B    1
#> 15       0B       0B    0.00     0B     0B     0B     0B    0
#> 16       0B       0B    0.00     0B     0B     0B     0B    0
#> 17       0B       0B    0.00     0B     0B     0B     0B    0
#> 18       0B       0B    0.00     0B     0B     0B     0B    0
#> 19       0B       0B    0.00     0B     0B     0B     0B    0
#> 20 347.6MiB 1.943GiB   17.47  121MB 98.4MB     0B     0B   12
#> 21 21.32MiB 1.943GiB    1.07 98.3MB  120MB     0B     0B   55
#>            record_time extra
#> 1  2020-04-11 23:39:58      
#> 2  2020-04-11 23:39:58      
#> 3  2020-04-11 23:39:58      
#> 4  2020-04-11 23:39:58      
#> 5  2020-04-11 23:39:58      
#> 6  2020-04-11 23:39:58      
#> 7  2020-04-11 23:39:58      
#> 8  2020-04-11 23:39:58      
#> 9  2020-04-11 23:39:58      
#> 10 2020-04-11 23:39:58      
#> 11 2020-04-11 23:39:58      
#> 12 2020-04-11 23:39:58      
#> 13 2020-04-11 23:39:58      
#> 14 2020-04-11 23:39:58      
#> 15 2020-04-11 23:39:58      
#> 16 2020-04-11 23:39:58      
#> 17 2020-04-11 23:39:58      
#> 18 2020-04-11 23:39:58      
#> 19 2020-04-11 23:39:58      
#> 20 2020-04-11 23:39:58      
#> 21 2020-04-11 23:39:58
```

Or from a subset of containers:

``` r
dockerstats("mongo", "proxy")
#>   Container  Name
#> 1     mongo mongo
#> 2     proxy proxy
#>                                                                 ID CPUPerc
#> 1 9e9605a015d4378283947ed16f547a8272039ec853b4962010203204d2c05167    2.57
#> 2 ca323ae39e42d898417b019b2bf7f06feaf877d248cd71b9cad8eebc3f5e1126    0.00
#>   MemUsage MemLimit MemPerc   NetI  NetO BlockI BlockO PIDs         record_time
#> 1 21.33MiB 1.943GiB    1.07 98.3MB 120MB     0B     0B   55 2020-04-11 23:40:00
#> 2       0B       0B    0.00     0B    0B     0B     0B    0 2020-04-11 23:40:00
#>   extra
#> 1      
#> 2
```

The `extra` param is used to add extra information to the recording,
which can be usefull is you want to tag the specific recording.

For example, here we mimic a connection on the `hexmake`
container

``` r
system("docker run --name hexmake --rm -p 2811:80 colinfay/hexmake", wait = FALSE)
```

``` r
library(crrri)
chrome <- Chrome$new(
  bin = pagedown::find_chrome(), 
  debug_port = httpuv::randomPort()
)

client <- chrome$connect(callback = function(client) {
  client
})

Page <- client$Page
Page$navigate(url = "http://localhost:2811")

dockerstats::dockerstats("hexmake", extra = "Connection via chrome")

chrome$close()
```

### dockerstats\_recurse

`dockerstats_recurse()` is a wrapper around `dockerstats()` that runs
every `every` seconds, calling the `callback` function everytime a loop
is completed.

By default, the callback is `print`, but you can define your own. For
example, this function will run the `dockerstats()` fun every 2 seconds
and save it to a file.

``` r
dockerstats_recurse(
  "hexmake",
  callback = function(res){
    print(
      paste("Mem usage: ", res$MemUsage)
    )
    write.table(
      res, 
      "dockerstats.csv", 
      append = TRUE, 
      col.names = FALSE, 
      row.names = FALSE, 
      sep = ","
    )
  }
)
```

As this is a pretty common use-case, a wrapper for this is implemented:

``` r
dockerstats_recurse(
  "hexmake",
  callback = append_csv("dockerstats.csv", print = TRUE)
)
```

## How columns are transformed

  - `CPUPerc` and `MemPerc` are stripped from the trailing `%`, and are
    turned into numeric

  - `MEM USAGE / LIMIT` is splitted into two columns, `MemUsage` and
    \`MemLimit

  - `NET I/O` and `BLOCK I/O` are splitted into two columns,
    respectively `NetI` & `NetO`, and `BlockI` & `BlockO`

## Manipulate columns expressed in bite size

You can call `as_fs_byte()` from the `{fs}` package to manipulate the
columns which are expressed in bytes.

Note that you’ll need to install the `{fs}` package (it’s not imported
by `{dockerstats}`).

``` r
dock_stats <- dockerstats()

sort(dock_stats$MemUsage)
#> [1] "110.9MiB" "21.29MiB" "347.5MiB" "516KiB"

dock_stats$MemUsage <- fs::as_fs_bytes(
  dock_stats$MemUsage
)
sort(dock_stats$MemUsage)
#> 516K  21.3M 110.9M 347.5M
```

``` r
library(ggplot2)
ggplot(
  dock_stats, 
  aes(
    reorder(Name, MemUsage), 
    MemUsage)
) + 
  geom_col() +
  scale_y_continuous(labels = scales::comma) + 
  coord_flip() + 
  labs(
    title = "MemUsage of running containers", 
    y = "MemUsage in bytes"
  )
```

<img src="man/figures/README-unnamed-chunk-12-1.png" width="100%" />

``` r
system("docker kill hexmake")
```
