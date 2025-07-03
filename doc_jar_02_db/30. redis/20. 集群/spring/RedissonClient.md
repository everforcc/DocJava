<span  style="font-family: Simsun,serif; font-size: 17px; ">

- 参考 oneforall代码

~~~
    /**
     * 1. 集群
     */
    @Bean
    public RedissonClient redissonClientCluster() {
        Config config = new Config();
        ClusterServersConfig clusterServersConfig = config.useClusterServers();
        clusterServersConfig.setScanInterval(2000); // cluster state scan interval in milliseconds
//                .addNodeAddress("redis://127.0.0.1:6380", "redis://127.0.0.1:6381")
//                .addNodeAddress("redis://127.0.0.1:6382");
        clusterServersConfig.setPassword(password);
        clusterServersConfig.setTimeout(timeout);

        String[] cluster = clusterNodes.split(",");
        for (String node : cluster) {
            String[] hostAndPort = node.split(":");
            clusterServersConfig.addNodeAddress("redis://" + hostAndPort[0] + ":" + hostAndPort[1]);
        }

        RedissonClient redisson = Redisson.create(config);
        return redisson;
    }
~~~

</span>