# UFC 后端配置

| 参数                               | 描述                  | 默认                                    | 必须 | 作用域                 |
|------------------------------------|-----------------------|-----------------------------------------|------|------------------------|
| `persistence.enabled`              |                       | `false`                                 |      | `deployment/pvc`       |
| `persistence.existingClaim`        |                       |                                         |      | `deployment/pvc`       |
| `persistence.size`                 |                       |                                         |      | `pvc`                  |
| `persistence.accessMode`           |                       |                                         |      | `pvc`                  |
| `persistence.storageClass`         |                       |                                         |      | `pvc`                  |
| `persistence.annotations`          |                       | `-`                                     |      | `pvc`                  |
| `service.type`                     |                       | `ClusterIP`                             |      | `service`              |
| `service.port`                     |                       | `80`                                    |      | `service/ingress`      |
| `ingress.enabled`                  |                       |                                         |      | `ingress`              |
| `ingress.annotations`              |                       |                                         |      | `ingress`              |
| `ingress.hosts`                    |                       |                                         |      | `ingress`              |
| `ingress.tls`                      |                       |                                         |      | `ingress`              |

# 阿里云 Arms 监控

| 参数              | 描述                 | 默认    | 必须 | 作用域                 |
|-------------------+----------------------+---------+------+------------------------|
| `arms.enabled`    | 是否开启监控         | `false` |      | `configmap/deployment` |
| `arms.appName`    | JVM 启动时区         |         |      | `deployment`           |
| `arms.licenseKey` | 本地存储文件存储路径 |         |      | `deployment/secret`    |

# MySQL 配置

如果 `mysql.enabled`，启动内部 MySQL，`mysql` 的配置见 [helm/charts/stable/mysql](https://github.com/helm/charts/tree/master/stable/mysql)，否则使用 `externalMySql` 配置：

| 参数                     | 描述                                        | 必须 | 作用域                      |
|--------------------------|---------------------------------------------|------|-----------------------------|
| `mysql.enabled`          | false 则使用 `externalMySql.*` 配置的数据库 |      | deployment/configmap/secret |
| `externalMySql.url`      |                                             | true | configmap                   |
| `externalMySql.username` |                                             | true | configmap                   |
| `externalMySql.password` |                                             | true | secret                      |

另外 `mysql` 添加了自定义 jdbc 参数：

| 参数                   | 默认                                                                                         | 作用域    |
|------------------------|----------------------------------------------------------------------------------------------|-----------|
| `mysql.extralJdbcArgs` | `allowMultiQueries=true&useLegacyDatetimeCode=false&useUnicode=true&characterEncoding=utf-8` | configmap |

# Mqtt 配置

| 参数               | 默认   | 必须 | 作用域      |
|-------------------|--------|------|-------------|
| `mqtt.username`   |        | true | `configmap` |
| `mqtt.password`   |        | true | `secret`    |
| `mqtt.brokerHost` |        | true | `configmap` |
| `mqtt.brokerPort` | `1883` |      | `configmap` |

