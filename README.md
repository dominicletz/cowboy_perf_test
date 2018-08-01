# CowboyTest

Start server with
`iex -S mix run`

Run perf test with
`./test.sh`

## Results

Letz Machine: 20000 req/s (stopped test after 5 secs)

```
Benchmarking localhost (be patient)
^C

Server Software:        Cowboy
Server Hostname:        localhost
Server Port:            8080

Document Path:          /
Document Length:        14 bytes

Concurrency Level:      20
Time taken for tests:   5.649 seconds
Complete requests:      118782
Failed requests:        0
Keep-Alive requests:    118675
Total transferred:      20311187 bytes
HTML transferred:       1662948 bytes
Requests per second:    21028.18 [#/sec] (mean)
Time per request:       0.951 [ms] (mean)
Time per request:       0.048 [ms] (mean, across all concurrent requests)
Transfer rate:          3511.45 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       1
Processing:     0    1   0.9      1      28
Waiting:        0    1   0.9      1      28
Total:          0    1   0.9      1      28

Percentage of the requests served within a certain time (ms)
  50%      1
  66%      1
  75%      1
  80%      1
  90%      1
  95%      2
  98%      2
  99%      4
 100%     28 (longest request)
```
