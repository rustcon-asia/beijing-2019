---
title: TiKV overview
description: Some basic facts about TiKV
weight: 2
---

**TiKV** is a distributed transactional key-value database originally created by [PingCAP](https://pingcap.com/en) to complement [TiDB](https://github.com/pingcap/tidb).

{{< info >}}
The **Ti** in TiKV stands for **titanium**. Titanium has the highest strength-to-density ratio of any metallic element and is named after the Titans of Greek mythology.
{{< /info >}}

## Features

{{< features >}}

## Code

TiKV is written in [Rust](https://www.rust-lang.org) and powered by the [Raft](https://raft.github.io) consensus algorithm.

## Inspiration

TiKV was originally inspired by [Google Spanner](https://ai.google/research/pubs/pub39966) and [HBase](https://hbase.apache.org).

## Architecture

The basic architecture of TiKV is described in the diagram below:

{{< figure src="https://www.lucidchart.com/publicSegments/view/d6ff8e03-ed36-46b3-83b3-a1ce79db03a4/image.png" caption="The architecture of TiKV" alt="TiKV architecture diagram" width="70" number="1" >}}

You can read more in the [Concepts and architecture](architecture) documentation.
