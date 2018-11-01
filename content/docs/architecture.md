---
title: Concepts and architecture
description: How TiKV works and how it was built
weight: 3
---

This page discusses the core concepts and architecture behind TiKV, including:

* The [APIs](#apis) that applications can use to interact with TiKV
* The basic [system architecture](#system) underlying TiKV
* The anatomy of each [instance](#instance) in a TiKV installation
* The role of core system components, including the [Placement Driver](#placement-driver), [Store](#store), [Region](#region), and [Node](#node)
* TiKV's [transaction model](#transactions)
* The role of the [Raft consensus algorithm](#raft) in TiKV
* The [origins](#origins) of TiKV

## APIs

TiKV provides two APIs that you can use to interact with it:

API | Description | Atomicity | Use when...
:---|:------------|:----------|:-----------
Raw | A lower-level key-value API for interacting directly with individual key-value pairs. | Single key | Your application doesn't require distributed transactions or multi-version concurrency control (**MVCC**)
Transactional | A higher-level key-value API that provides ACID semantics | Multiple keys | Your application requires distributed transactions and/or MVCC

## System architecture {#system}

The overall architecture of TiKV is illustrated in **Figure 1** below:

{{< figure
    id="d6ff8e03-ed36-46b3-83b3-a1ce79db03a4"
    caption="The architecture of TiKV"
    alt="TiKV architecture diagram"
    width="70"
    number="1" >}}

## TiKV instance {#instance}

The architecture of each TiKV instance is illustrated in **Figure 2** below:

{{< figure
    id="f371145f-126d-42e0-99fe-2c06080419a9"
    caption="TiKV instance architecture"
    alt="TiKV instance architecture diagram"
    width="60"
    number="2" >}}


## Placement driver (PD) {#placement-driver}

The TiKV placement driver is the cluster manager of TiKV, which periodically checks replication constraints to balance load and data automatically across nodes and regions in a process called **auto-sharding**.

## Store

There is a [RocksDB](https://rocksdb.org) database within each Store and it stores data into the local disk.

## Region

Region is the basic unit of key-value data movement. Each Region is replicated to multiple Nodes. These multiple replicas form a Raft group.

## Node

A TiKV **Node** is just a physical node in the cluster, which could be a virtual machine, a container, etc. Within each Node, there are one or more **Store**s. The data in each Store is split across multiple regions. Data is distributed across Regions using the Raft algorithm.

When a Node starts, the metadata for the Node, Store, and Region is recorded into the Placement Driver. The status of each Region and Store is regularly reported to the PD.

## Transaction model {#transactions}

TiKV's transaction model is similar to that of Google's [Percolator](https://ai.google/research/pubs/pub36726), a system built for processing updates to large data sets. Percolator uses an incremental update model in place of a batch-based model.

TiKV's transaction model provides:

* **Snapshot isolation** with lock, with semantics analogous to `SELECT ... FOR UPDATE` in SQL
* Externally consistent reads and writes in distributed transactions

## Raft

Data is distributed across TiKV instances via the [Raft consensus algorithm](https://raft.github.io/), which is based on the so-called [Raft paper](https://raft.github.io/raft.pdf) ("In Search of an Understandable Consensus Algorithm") from [Diego Ongaro](https://ongardie.net/diego/) and [John Ousterhout](https://web.stanford.edu/~ouster/cgi-bin/home.php).

## The origins of TiKV {#origins}

TiKV was originally created by [PingCAP](https://pingcap.com) to complement [TiDB](https://github.com/pingcap/tidb), a distributed [HTAP](https://en.wikipedia.org/wiki/Hybrid_transactional/analytical_processing_(HTAP)) database compatible with the [MySQL protocol](https://dev.mysql.com/doc/dev/mysql-server/latest/PAGE_PROTOCOL.html).
