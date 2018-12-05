---
title: TiKV 2.1 GA Release Notes
date: 2018-11-30
---

On November 30, 2018, TiKV 2.1 GA is released. See the following updates in this release. Compared with TiKV 2.0, this release has great improvements in stability, performance, and usability.

<!--more-->

## Coprocessor

- Add more built-in functions
- [Add Coprocessor `ReadPool` to improve the concurrency in processing the requests](https://github.com/tikv/rfcs/blob/master/text/2017-12-22-read-pool.md)
- Fix the time function parsing issue and the time zone related issues
- Optimize the memory usage for pushdown aggregation computing

## Transaction

- Optimize the read logic and memory usage of MVCC to improve the performance of the scan operation and the performance of full table scan is 1 time better than that in TiDB 2.0
- Fold the continuous Rollback records to ensure the read performance
- [Add the `UnsafeDestroyRange` API to support to collecting space for the dropping table/index](https://github.com/tikv/rfcs/blob/master/text/2018-08-29-unsafe-destroy-range.md)
- Separate the GC module to reduce the impact on write
- Add the `upper bound` support in the `kv_scan` command

## Raftstore

- Improve the snapshot writing process to avoid RocksDB stall
- [Add the `LocalReader` thread to process read requests and reduce the delay for read requests](https://github.com/tikv/rfcs/pull/17)
- [Support `BatchSplit` to avoid large Region brought by large amounts of write](https://github.com/tikv/rfcs/pull/6)
- Support `Region Split` according to statistics to reduce the I/O overhead
- Support `Region Split` according to the number of keys to improve the concurrency of index scan
- Improve the Raft message process to avoid unnecessary delay brought by `Region Split`
- Enable the `PreVote` feature by default to reduce the impact of network isolation on services

## Storage Engine

- Fix the `CompactFiles`bug in RocksDB and reduce the impact on importing data using Lightning
- Upgrade RocksDB to v5.15 to fix the possible issue of snapshot file corruption
- Improve `IngestExternalFile` to avoid the issue that flush could block write

## tikv-ctl

- [Add the `ldb` command to diagnose RocksDB related issues](https://github.com/tikv/tikv/blob/master/docs/tools/tikv-control.md#ldb-command)
- The `compact` command supports specifying whether to compact data in the bottommost level
