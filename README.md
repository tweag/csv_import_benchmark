# Importing CSV with Active Record

Importing 100,000 rows:

```
                     user     system      total        real
1_dumb:         92.690000   6.090000  98.780000 (139.024553)
2_foreach:      86.530000   5.240000  91.770000 (127.267272)
3_transaction:  65.190000   2.240000  67.430000 ( 80.737074)
4_ar_import:    16.050000   0.200000  16.250000 ( 18.024625)
5_parallel:      1.620000   0.070000  28.880000 ( 12.372190)
6_pg_copy:       1.970000   0.090000   4.240000 (  3.074719)
7_pg_copy_csv:   0.090000   0.040000   1.580000 (  0.871795)
```
