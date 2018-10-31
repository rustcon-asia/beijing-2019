---
title: APIs
description: Interact with TiKV using the raw key-value API or the transactional key-value API
weight: 4
draft: true
---

TiKV offers two APIs that you can use to interact with it:

* A [raw](#raw) API
* A [transactional](#transactional) API

## Raw key-value API {#raw}

The raw key-value API is a simple API that enables you to interact with TiKV

To try out the raw key-value API:

1. Install the necessary packages:

    ```shell
    go get -v -u github.com/pingcap/tidb/store/tikv
    ```

1. Import the dependency packages:

    ```go
    import (
        "fmt"
        "github.com/pingcap/tidb/config"
        "github.com/pingcap/tidb/store/tikv"
    )
    ```

1. Create a raw key-value client:

    ```go
    cli, err := tikv.NewRawKVClient([]string{"192.168.199.113:2379"}, config.Security{})
    ```

    Description of two parameters in the above command:

    * `string`: a list of PD servers' addresses
    * `config.Security`: used to establish TLS connections, usually left empty when you do not need TLS

1. Call the Raw Key-Value client methods to access the data on TiKV. The Raw Key-Value API contains the following methods, and you can also find them in the [GoDoc](https://godoc.org/github.com/pingcap/tidb/store/tikv#RawKVClient).

    ```go
    type RawKVClient struct
    func (c *RawKVClient) Close() error
    func (c *RawKVClient) ClusterID() uint64
    func (c *RawKVClient) Delete(key []byte) error
    func (c *RawKVClient) Get(key []byte) ([]byte, error)
    func (c *RawKVClient) Put(key, value []byte) error
    func (c *RawKVClient) Scan(startKey []byte, limit int) (keys [][]byte, values [][]byte, err error)
    ```

## Transactional key-value API {#transactional}
