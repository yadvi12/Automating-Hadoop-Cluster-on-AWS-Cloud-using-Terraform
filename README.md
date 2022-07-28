## Automating-Hadoop-Cluster-on-AWS-Cloud-using-Terraform

The goal is to install a Hadoop Cluster on machines running Linux on top of AWS public cloud.

## Usage:
- Install Terraform on your system.
- Clone this repository in any location you want.
- Edit the file ``terraform.tfvars`` according to your requirements.
- Open the command prompt and cd to the location of the cloned repository.
- Run the command ``terraform init``.
- Apply the script by running the command ``terraform apply -auto-approve``.

Note: You need to have an AWS IAM user account to set the access key and secret key in the variables file.

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

</br>

<div align="center">
    <a href="https://allcontributors.org">
        <img width="30%" height="50%" src="/images/contribute.svg" alt="✨ All Contributors ✨" width="800px" />
    </a>
</div>
