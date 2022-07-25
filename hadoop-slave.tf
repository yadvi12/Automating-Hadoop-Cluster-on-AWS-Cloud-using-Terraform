# 1ST DATANODE

resource "aws_instance" "web1" {
  ami             = var.ami_id
  instance_type   = var.machine_type
  key_name        = var.keyName
  security_groups = [aws_security_group.minorprojectsecurity.id]
  subnet_id       = var.subnetID

  tags = {
    Name = "dataNode-1"
  }
}

resource "aws_ebs_volume" "v1" {
  availability_zone = "ap-south-1b"
  size              = 10

  tags = {
    Name = "datanode1_vol"
  }
}

resource "aws_volume_attachment" "ebs_att1" {
  device_name  = "/dev/sdh"
  volume_id    = aws_ebs_volume.v1.id
  instance_id  = aws_instance.web1.id
  force_detach = true
}

resource "null_resource" "nullremote5" {

  depends_on = [
    aws_volume_attachment.ebs_att1,
  ]


  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.keyLocation)
    host        = aws_instance.web1.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install git -y",
      "sudo rpm -ivh --force https://repo.huaweicloud.com/java/jdk/8u171-b11/jdk-8u171-linux-x64.rpm",
      "sudo rpm -ivh https://archive.apache.org/dist/hadoop/core/hadoop-1.2.1/hadoop-1.2.1-1.x86_64.rpm --force",
      "cd",
      "sudo mkdir /dn",
      "cd /etc/hadoop",
      "sudo rm -rf hdfs-site.xml core-site.xml",
      "cd",
      "sudo git clone https://github.com/yadvi12/Hadoop-configuration-files.git  /hdfs",
      "cd /hdfs",
      "sudo sed -i 's/0.0.0.0/${aws_instance.web.public_ip}/' core-site.xml",
      "sudo sed -i 's/nn/dn/' hdfs-site.xml",
      "sudo mv hdfs-site.xml core-site.xml /etc/hadoop",
      "sudo hadoop datanode -format -force",
      "sudo hadoop-daemon.sh start datanode"
    ]
  }
}





# 2ND DATANODE

resource "aws_instance" "web2" {
  ami           = var.ami_id
  instance_type = var.machine_type
  key_name = var.keyName
  security_groups = [aws_security_group.minorprojectsecurity.id]
  subnet_id = var.subnetID

  tags = {
    Name = "dataNode-2"
  }
}

resource "aws_ebs_volume" "v2" {
  availability_zone = "ap-south-1b"
  size              =  10
  
  tags = {
    Name = "datanode2_vol"
  }
}

resource "aws_volume_attachment" "ebs_att2" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.v2.id}"
  instance_id = "${aws_instance.web2.id}"
  force_detach = true
}

resource "null_resource" "nullremote6"  {

depends_on = [
    aws_volume_attachment.ebs_att2,
  ]


  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file(var.keyLocation)
    host     = aws_instance.web2.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "sudo yum install git -y",
      "sudo rpm -ivh --force https://repo.huaweicloud.com/java/jdk/8u171-b11/jdk-8u171-linux-x64.rpm",
      "sudo rpm -ivh https://archive.apache.org/dist/hadoop/core/hadoop-1.2.1/hadoop-1.2.1-1.x86_64.rpm --force",
      "cd",
      "sudo mkdir /dn",
      "cd /etc/hadoop",
      "sudo rm -rf hdfs-site.xml core-site.xml",
      "cd",
      "sudo git clone https://github.com/yadvi12/Hadoop-configuration-files.git  /hdfs",
      "cd /hdfs",
      "sudo sed -i 's/0.0.0.0/${aws_instance.web.public_ip}/' core-site.xml",
      "sudo sed -i 's/nn/dn/' hdfs-site.xml",
      "sudo mv hdfs-site.xml core-site.xml /etc/hadoop",
      "sudo hadoop datanode -format -force",
      "sudo hadoop-daemon.sh start datanode"
    ]
  }
}





# 3RD DATANODE

resource "aws_instance" "web3" {
  ami           = var.ami_id
  instance_type = var.machine_type
  key_name = var.keyName
  security_groups = [aws_security_group.minorprojectsecurity.id]
  subnet_id = var.subnetID 

  tags = {
    Name = "dataNode-3"
  }
}

resource "aws_ebs_volume" "v3" {
  availability_zone = "ap-south-1b"
  size              =  10
  
  tags = {
    Name = "datanode3_vol"
  }
}

resource "aws_volume_attachment" "ebs_att3" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.v3.id}"
  instance_id = "${aws_instance.web3.id}"
  force_detach = true
}

resource "null_resource" "nullremote7"  {

depends_on = [
    aws_volume_attachment.ebs_att3,
  ]


  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file(var.keyLocation)
    host     = aws_instance.web3.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "sudo yum install git -y",
      "sudo rpm -ivh --force https://repo.huaweicloud.com/java/jdk/8u171-b11/jdk-8u171-linux-x64.rpm",
      "sudo rpm -ivh https://archive.apache.org/dist/hadoop/core/hadoop-1.2.1/hadoop-1.2.1-1.x86_64.rpm --force",
      "cd",
      "sudo mkdir /dn",
      "cd /etc/hadoop",
      "sudo rm -rf hdfs-site.xml core-site.xml",
      "cd",
      "sudo git clone https://github.com/yadvi12/Hadoop-configuration-files.git  /hdfs",
      "cd /hdfs",
      "sudo sed -i 's/0.0.0.0/${aws_instance.web.public_ip}/' core-site.xml",
      "sudo sed -i 's/nn/dn/' hdfs-site.xml",
      "sudo mv hdfs-site.xml core-site.xml /etc/hadoop",
      "sudo hadoop datanode -format -force",
      "sudo hadoop-daemon.sh start datanode"
    ]
  }
}
