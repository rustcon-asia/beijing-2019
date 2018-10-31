---
title: Deployment
description: Run TiKV using Ansible or Docker
weight: 5
draft: true
---

This document tells you how to install TiKV using:

* [Ansible](#ansible)
* [Docker](#docker)

## Ansible

Ansible is an IT automation tool that can configure systems, deploy software, and orchestrate more advanced IT tasks such as continuous deployments or zero downtime rolling updates.

[TiDB-Ansible](https://github.com/pingcap/tidb-ansible) is a TiDB cluster deployment tool developed by PingCAP, based on Ansible playbook. TiDB-Ansible enables you to quickly deploy a new TiKV cluster which includes PD, TiKV, and the cluster monitoring modules.

{{< warning >}}
For production environments, use TiDB-Ansible to deploy your TiKV cluster. If you only want to try TiKV out and explore the features, see Install and Deploy TiKV using Docker Compose on a single machine.
{{< /warning >}}

### Prepare

Before you start, make sure you have:

1. Several target machines that meet the following requirements:

  * 4 or more machines. A standard TiKV cluster contains 6 machines. You can use 4 machines for testing.
  * CentOS 7.3 (64 bit) or later with Python 2.7 installed, x86_64 architecture (AMD64)
  * Network between machines

    **Note**: When you deploy TiKV using Ansible, use SSD disks for the data directory of TiKV and PD nodes. Otherwise, the system will not perform well.

2. A Control Machine that meets the following requirements:

  * CentOS 7.3 (64 bit) or later with Python 2.7 installed
  * Access to the Internet
  * Git installed

    **Note**: The Control Machine can be one of the target machines.

TODO...

## Docker

TODO
