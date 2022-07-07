# Infrastructure

## AWS Zones
Identify your zones here

## Servers and Clusters

### Table 1.1 Summary
| Asset                         | Purpose                    | Size                                                                  | Qty                                                             | DR                                                                                                           |
|-------------------------------|----------------------------|-----------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Asset name                    | Brief description          | AWS size eg. t3.micro (if applicable, not all assets will have a size) | Number of nodes/replicas or just how many of a particular asset | Identify if this asset is deployed to DR, replicated, created in multiple locations or just stored elsewhere |
| ALB Application Load Balancer | Entry Point of Grafana     |                                                                       | 1                                                               | DR, deployed in each Region                                                                                  |
| VPC / Subnet                  | Network for application    | /16                                                                   | 1                                                               | DR, public and private subnet are in multiple AZs                                                            |
| EKS Control Plane             | Control K8s cluster        |                                                                       |                                                                 | DR, deployed in multiple AZs                                                                                 |
| EKS Worker Nodes              | EC2 Nodes of the cluster   | t3.medium                                                             | 2 - 5                                                           | DR, deployed in multiple AZs                                                                                 |
| EC2 intance                   | Web server                 | t3.medium                                                             | 3                                                               | DR, deployed in all AZs                                                                                      |
| Key Pairs                     | SSH keys                   |                                                                       | 1                                                               | DR, deployed in each AZs                                                                                     |
| IAM Roles                     |                            |                                                                       | 1                                                               | DR, deployed in each AZs                                                                                     |
| Security Groups               | Firewall configurations    |                                                                       | 1                                                               | DR, deployed in each AZs                                                                                     |
| Aurora Cluster                | RDS instances with replica |                                                                       | 2                                                               | Read Replicas, deployed in each AZs                                                                          |
| AMIs                          | Images for EC2 instance    |                                                                       | 1                                                               | Deployed in both AZs                                                                                         |

### Descriptions
More detailed descriptions of each asset identified above.

## DR Plan
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.

## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region