# Infrastructure

## AWS Zones
Identify your zones here

## Servers and Clusters

### Table 1.1 Summary
| Asset                         | Purpose                                       | Size                                                                   | Qty                                                             | DR                                                                                                           |
|-------------------------------|-----------------------------------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Asset name                    | Brief description                             | AWS size eg. t3.micro (if applicable, not all assets will have a size) | Number of nodes/replicas or just how many of a particular asset | Identify if this asset is deployed to DR, replicated, created in multiple locations or just stored elsewhere |
| ALB Application Load Balancer | Entry Point of Grafana                        | N/A                                                                    | 1                                                               | DR, deployed in each Region                                                                                  |
| VPC / Subnet                  | Network for application                       | /16                                                                    | 1                                                               | DR, public and private subnet are in multiple AZs                                                            |
| EKS Control Plane             | Control K8s cluster                           | N/A                                                                    | N/A                                                             | DR, deployed in multiple AZs                                                                                 |
| EKS Worker Nodes              | EC2 Nodes of the cluster                      | t3.medium                                                              | 2 - 5                                                           | DR, deployed in multiple AZs                                                                                 |
| EC2 intance                   | Web server                                    | t3.medium                                                              | 3                                                               | DR, deployed in all AZs                                                                                      |
| Key Pairs                     | SSH keys                                      | N/A                                                                    | 1                                                               | DR, deployed in each AZs                                                                                     |
| IAM Roles                     | Used to control access of the cloud resources | N/A                                                                    | 1                                                               | DR, deployed in each AZs                                                                                     |
| Security Groups               | Firewall configurations                       | N/A                                                                    | 1                                                               | DR, deployed in each AZs                                                                                     |
| Aurora Cluster                | RDS instances with replica                    | N/A                                                                    | 2                                                               | Read Replicas, deployed in each AZs                                                                          |
| AMIs                          | Images for EC2 instance                       | N/A                                                                    | 1                                                               | Deployed in both AZs                                                                                         |

### Descriptions
* VPCs have IPs in multiple availability zones.
* 1 Cluster in each region with 2 nodes.
* 1 ALB deployed in each region for the web servers.
* 2 S3 buckets. One in each region.
* 3 Ubuntu EC2 instances for web in each region.
* 2 RDS clusters (with each primary/secondary nodes deployed), one in each region  with a backup retention policy of 5 days.
* Replication of RDS between region1 and region2.

## DR Plan
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.
* Create a Route53 record, configure DNS failover policy to shift the traffic
* Preconfigure the S3 (Terraform State files) and AMIs
* Configure Terraform files (duplicate configuration in zone2 with correct AZs)
* Create Key Pairs and deploy the EKS Clusters, Security Groups
* Deploy Prometheus and Grafana
* Access the DR Dashboard on Grafana the check the DR deployment 
* Deploy the ALB, EC2 and check the DR Dashboard
* Configure the read RDS cluster with replication on primary cluster
* Monitor again

## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region
* Stop the RDS in primary region, failover will point to the read cluster
* Verify the RDS failed over
* Redirect the IP to the new Cluster write and read replicas
* Redirect the IPs of the ALB to the new Failover region