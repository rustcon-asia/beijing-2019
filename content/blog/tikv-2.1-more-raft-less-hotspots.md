---
title: "TiKV 2.1: More Raft, Less Hotspots"
date: 2018-12-04
author: Siddon Tang
---

**Author:** Siddon Tang, Chief Engineer at PingCAP and TiKV Project Lead

The TiKV team is proud to announce today that TiKV 2.1 is ready for General Availability (GA). TiKV is an open-source distributed transactional [key-value store](https://github.com/tikv/tikv) built in Rust.

Since its [2.0](https://www.pingcap.com/blog/tidb-2-0-announcement/) release back in April 2018, TiKV became a member project of the [Cloud Native Computing Foundation](https://www.cncf.io/blog/2018/08/28/cncf-to-host-tikv-in-the-sandbox/), so it can be an independent foundational building block for other systems.

TiKV is currently being adopted in production by [hundreds of companies](https://pingcap.com/success-stories/), often times together with [TiDB](https://github.com/pingcap/tidb), its stateless SQL layer companion, but also increasingly on its own to help users unify its data storage layer while exposing a key-value interface. It is currently serving millions of users in industries from banking, fintech, and insurance, to food delivery, ridesharing, and gaming. The largest cluster has more than 100 nodes storing 100+ TB of data.

The TiKV community is also thriving, with 39 new contributors since 2.0 and a newly [open-sourced Redis implementation](https://github.com/meitu/titan) on top of TiKV called Titan, led by our friends at [Meitu](https://www.crunchbase.com/organization/meitu).

What's exciting isn't just the rate of adoption and community engagement, but also the multitude of real-world scenarios that TiKV is exposed to and must navigate with resilience and grace. In the last few months, it has had to handle cross-data center disaster recovery, six-figure throughput requirement, [massive traffic spike on Singles’ Day](https://twitter.com/pingcap/status/1061679993040834560) (one of the largest online shopping holidays in the world), hardware and network failures, and more.

These experiences shaped what we built in 2.1, so TiKV, whether it's used with TiDB or by itself, would always have your back and help you navigate the future and handle an unpredictable world.

## What's New in TiKV 2.1

There are many new features, improvements, and enhancements in 2.1. To check out the full list, please see the TiKV section of the [official 2.1 GA release notes](https://tikv.org/blog/tikv-2.1ga-release-notes/), but here are some major highlights:

### New and Improved Raft

The Raft consensus protocol inside TiKV is at the core of how it ensures strong consistency and high availability of your data. Thus, constantly improving Raft has always been a high priority. In 2.1, we have incorporated three new Raft features:

- PreVote -- this feature pre-checks the likelihood of certain members of a Raft group becoming a Leader before voting takes place, which reduces performance fluctuation and improves stability when a TiKV node enters or returns to a cluster.

- Learner -- a Raft Learner node is a non-voting member of a Raft group. By adding a Learner first before other voting members are added, this feature improves data safety and availability, especially in a cross-data center deployment.

- Region Merge -- automatically merge many small regions into one larger region to reduce cost of cluster management, and improve overall performance and stability for large-scale clusters. Note: this feature is available in 2.1 but not enabled by default.

### Hotspot Scheduling

Hotspot formation is one of the biggest enemies to a performant distributed database. It is also one of the most unpredictable -- you never know when and how hotspots could form to create bottlenecks in your system.

Thus, in this new version we did a lot of work to make TiKV, working with the Placement Driver (PD), smarter at detecting hotspot formation more quickly by aggregating additional system metadata to be monitored continuously. We also further optimized its ability to execute hotspot scheduling policy -- breaking up and distributing hotspots with more efficiency and lower system cost. Lastly, 2.1 also makes available an interface where users can manually break up Regions in specific TiKV nodes to remove hotspots, which can be useful in extreme situations where the system cannot respond quickly enough to remove hotspots automatically.  

### More Efficient Garbage Collection

In 2.1, we further optimized garbage collection (GC) in TiKV. The new optimization reduced GC's affect on online write performance, while increasing the speed in storage recovery. Based on our internal testing, when deleting a 1TB table in 2.1, it takes about 10 seconds to recover 99% of the storage space.

## Ode to Open Source

TiKV 2.1 simply would not be possible with the help and support of an increasingly vibrant open source community. We firmly believe that for TiKV to become a core infrastructure technology that can help its users handle an unpredictable world, the open source way is the only way forward to achieve that goal. And our community has more than validated our belief, with bug fixes, issue reports, and valuable contributions in every corner of this major release.

To encourage more community participation, we've made design documents for [TiKV](https://github.com/tikv/rfcs) public with a transparent RFC process. If you are interested in contributing to TiKV, please see our contribution guide [here](https://github.com/tikv/tikv/blob/master/CONTRIBUTING.md).

We are forever grateful and indebted to our open source community for always fueling our spirit with your encouragement, critique, contribution, and patience. TiKV would not be what it is today without you. And we can’t wait to take it to new heights with you, together.