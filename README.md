## Automating-Hadoop-Cluster-on-AWS-Cloud-using-Terraform

The goal is to install a Hadoop Cluster on machines running Linux on top of AWS public cloud.

## Usage

- Install Terraform on your system.
- Clone this repository in any location you want.
- CD to the location of the cloned repository.
- Edit the file ``terraform.tfvars`` according to your requirements.

Note: You need to have an AWS IAM user account to set the access key and secret key in the variables file.

## Verification

The Terraform script will set up the Hadoop Cluster, and it will redirect you to the Hadoop master node dashboard. It will show 3 nodes running in live nodes section. 

To verfiy further, connect to your master node and run the command ``hadoop dfsadmin -report``. It will show you the nodes running in the Hadoop Cluster.
