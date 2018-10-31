---
title: Configuration
description: Configure a wide range of TiKV facets, including RocksDB, gRPC, the Placement Driver, and more
weight: 7
draft: true
---

## RocksDB configuration {#rocksdb}

TiKV uses [RocksDB](https://rocksdb.org/) as its underlying storage engine for storing both [Raft logs](architecture#raft) and KV (key-value) pairs.

{{< info >}}
RocksDB was chosen for TiKV because it provides a highly customizable persistent key-value store that can be tuned to run in a variety of production environments, including pure memory, Flash, hard disks, or HDFS, it supports various compression algorithms, and it provides solid tools for production support and debugging.
{{< /info >}}

TiKV creates two RocksDB instances on each Node:

* A `rocksdb` instance that stores most TiKV data
* A `raftdb` that stores [Raft logs](architecture#raft) and has a single column family called `raftdb.defaultcf`

The `rocksdb` instance has three column families:

Column family | Purpose
:-------------|:-------
`rocksdb.defaultcf` | Stores actual KV pairs for TiKV
`rocksdb.writecf` | Stores commit information in the MVCC model

RocksDB can be configured on a per-column-family basis. Here's an example:

```toml
[rocksdb]
max-background-jobs = 8
```

### RocksDB configuration options

{{< config "rocksdb" >}}
