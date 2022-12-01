## Automating-Hadoop-Cluster-on-AWS-Cloud-using-Terraform

<p align="center">
 <img src="https://img.icons8.com/color/512/hadoop-distributed-file-system.png" width="30"  height="30"/>
 <img width="30"  height="30" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/terraform.svg" />
 <img src="https://img.icons8.com/color/48/000000/amazon-web-services.png" width="30"  height="30"/>
</p>                                                                                             

The goal is to install a Hadoop Cluster on machines running Linux on top of AWS public cloud.

## Problem Statement:
Nowadays, companies need a lot of storage to store their data. Massive amounts of data can be stored with Hadoop. Studies show that by 2023, 90% of all Fortune 500 companies will have adopted Hadoop. However, it may take hours or even days to set up a Hadoop Cluster for storing data. Businesses that utilize good time management are better positioned to deliver their product or service on time consistently. 

Why even need to care about storing this data and processing it? For what purpose? 
The answer is that we need this data to make more smart and calculative decisions in whatever field we are working on. Business forecasting is not a new thing. It has been prepared in the past as well, but with minimal data. Too ahead of the competition, businesses must use this data and then make more intelligent decisions. These decisions range from guessing the preferences of consumers to preventing fraud activities well in advance. Professionals in every field may find their reasons for analysis of this data. 

## Solution:
Introducing DevOps in software development enables the companies to plan the management of the servers in terms of space, time, and efforts to enable the handling of huge environments and cost-effectiveness. Automation saves time and money. It will also help in faster processing and better accuracy. 

In this project, we have automated the formation of the Hadoop Cluster with the help of Terraform, which is an automation tool used for multi-cloud deployment. The aim is to set up a Hadoop Cluster on AWS within a few seconds, whereas setting one up normally takes hours.

## Usage:
- Install Terraform on your system.
- Clone this repository in any location you want.
- Edit the file ``terraform.tfvars`` according to your requirements.
- Open the command prompt and cd to the location of the cloned repository.
- Run the command ``terraform init``.
- Apply the script by running the command ``terraform apply -auto-approve``.

Note: You need to have an AWS IAM user account to set the access key and secret key in the variables file.

### Destroying the Hadoop Architecture:
- To destroy the architecture, run thr command ``terraform destroy -auto-approve``.

Note: Be extremely careful before running the destroy command. Terraform will destroy all your managed infrastructure, there is no undo.

## Verification:
The Terraform script will set up the Hadoop Cluster, and it will redirect you to the Hadoop master node dashboard. It will show 3 nodes running in live nodes section. 

To verfiy further, connect to the master node and run the command ``hadoop dfsadmin -report``. It will show the nodes running in the Hadoop Cluster.

## Get Involved:
*  Read [Community Guidelines](<https://github.com/yadvi12/Automating-Hadoop-Cluster-on-AWS-Cloud-using-Terraform/blob/main/CONTRIBUTING.md>) for all
   kinds of ways to contribute to and interact with the project,
   including how to submit bug reports and
   code to repository.
*  Submit a proposed code update through a pull request to the ``master`` branch.
*  Talk to the owner before making larger changes
   to avoid duplicate efforts. This not only helps everyone
   know what is going on, it also helps save time and effort if we decide
   some changes are needed.
   
## License:
The Project is released under the terms of the MIT License.
<!-- </br>

<div align="center">
  <a href="https://allcontributors.org">
        <img width="30%" height="50%" src="/images/contribute.svg" alt="✨ All Contributors ✨" width="800px" />
    </a>
   
   </div>

   <br>
 -->
   
## All Contributors:   
  1. [Yadvi Bhalla](https://www.linkedin.com/in/yadvibhalla1210/)
  2. [Shashwat Mishra](https://www.linkedin.com/in/the-shashwat-mishra/)
  
   


