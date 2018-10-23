---
title: Getting started
description: Run TiKV in your local environment using Docker Compose
weight: 1
new: true
---

This guide describes how to quickly deploy a TiKV testing cluster using [Docker Compose](https://docs.docker.com/compose/) on a single machine. Currently, this installation method is supported only on Linux.

## Prerequisites

Make sure that you have the following items installed on your machine:

* [Docker](https://docker.com) (17.06.0 or later) and [Docker Compose](https://docs.docker.com/compose/)

    ```shell
    sudo yum install docker docker-compose
    ```

* [Helm](https://helm.sh/)

    ```shell
    curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
    ```

* [Git](https://git-scm.com/)

    ```shell
    sudo yum install git
    ```

## Install and deploy

1. Clone `tidb-docker-compose`

    ```shell
    git clone https://github.com/pingcap/tidb-docker-compose.git
    cd tidb-docker-compose
    ```
1. Edit the `compose/values.yaml` file to configure the `networkMode` and `host` and comment the `tidb` section out.

1. Generate the `generated-docker-compose.yml` file

    ```shell
    helm template compose > generated-docker-compose.yml
    ```

1. Create and start the cluster using the `generated-docker-compose.yml` file

    ```shell
    docker-compose -f generated-docker-compose.yml pull # Get the latest Docker images
    docker-compose -f generated-docker-compose.yml up -d
    ```

You can check whether the TiKV cluster has been successfully deployed using the following command:

```shell
curl localhost:2379/pd/api/v1/stores
```

If the state of all the TiKV instances is `Up` then you have successfully deployed a TiKV cluster!
