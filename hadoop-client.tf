resource "time_sleep" "wait_5_seconds" {
  depends_on = [null_resource.nullremote3]

  create_duration = "5s"
}


resource "aws_instance" "web4" {
  ami           = var.ami_id
  instance_type = var.machine_type
  key_name = var.keyName
  security_groups = [aws_security_group.minorprojectsecurity.id]
  subnet_id = var.subnetID

  tags = {
    Name = "client-1"
  }
}

resource "null_resource" "nullremote9"  {
  depends_on = [time_sleep.wait_5_seconds] 

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file(var.keyLocation)
    host     = aws_instance.web4.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "sudo yum install git -y",
      "sudo rpm -ivh --force https://repo.huaweicloud.com/java/jdk/8u171-b11/jdk-8u171-linux-x64.rpm",
      "sudo rpm -ivh https://archive.apache.org/dist/hadoop/core/hadoop-1.2.1/hadoop-1.2.1-1.x86_64.rpm --force",
      "cd",
      "sudo rm -rf core-site.xml",
      "cd",
      "sudo git clone https://github.com/yadvi12/Hadoop-configuration-files.git  /hdfs",
      "cd /hdfs",
      "sudo sed -i 's/0.0.0.0/${aws_instance.web.public_ip}/' core-site.xml",
      "sudo mv core-site.xml /etc/hadoop",
      "sudo hadoop fs -touchz a.txt"
    ]
  }
}

# 2nd client

resource "aws_instance" "web5" {
  ami           = var.ami_id
  instance_type = var.machine_type
  key_name = var.keyName
  security_groups = [aws_security_group.minorprojectsecurity.id]
  subnet_id = var.subnetID

  tags = {
    Name = "client-2"
  }
}


resource "null_resource" "nullremote10"  {

  depends_on = [time_sleep.wait_5_seconds]
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file(var.keyLocation)
    host     = aws_instance.web5.public_ip
  }


provisioner "remote-exec" {
    inline = [
      "sudo yum install git -y",
      "sudo rpm -ivh --force https://repo.huaweicloud.com/java/jdk/8u171-b11/jdk-8u171-linux-x64.rpm",
      "sudo rpm -ivh https://archive.apache.org/dist/hadoop/core/hadoop-1.2.1/hadoop-1.2.1-1.x86_64.rpm --force",
      "cd",
      "sudo rm -rf core-site.xml",
      "cd",
      "sudo git clone https://github.com/yadvi12/Hadoop-configuration-files.git  /hdfs",
      "cd /hdfs",
      "sudo sed -i 's/0.0.0.0/${aws_instance.web.public_ip}/' core-site.xml",
      "sudo mv core-site.xml /etc/hadoop",
      "sudo hadoop fs -touchz b.txt"
    ]
  }
}