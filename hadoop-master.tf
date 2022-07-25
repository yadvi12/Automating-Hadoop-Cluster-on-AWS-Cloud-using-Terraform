resource "aws_security_group" "minorprojectsecurity" {
  name        = "minorprojectsecurity"
  description = "Allow TLS inbound traffic"
  
  ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "minorprojectsecurity"
  }
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.machine_type
  key_name = var.keyName
  security_groups = [aws_security_group.minorprojectsecurity.id]
  subnet_id = var.subnetID

  tags = {
    Name = "masterNode"
  }
}

resource "aws_ebs_volume" "v" {
  availability_zone = "ap-south-1b"
  size              =  10
  
  tags = {
    Name = "masterVolume"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.v.id}"
  instance_id = "${aws_instance.web.id}"
  force_detach = true
}


resource "null_resource" "nullremote3"  {

depends_on = [
    aws_volume_attachment.ebs_att,
  ]


  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file(var.keyLocation)
    host     = aws_instance.web.public_ip
  }

provisioner "remote-exec" {
    inline = [
      "sudo yum install git -y",
      "sudo rpm -ivh --force https://repo.huaweicloud.com/java/jdk/8u171-b11/jdk-8u171-linux-x64.rpm",
      "sudo rpm -ivh https://archive.apache.org/dist/hadoop/core/hadoop-1.2.1/hadoop-1.2.1-1.x86_64.rpm --force",
      "cd",
      "sudo mkdir /nn",
      "cd /etc/hadoop",
      "sudo rm -rf hdfs-site.xml core-site.xml",
      "cd",
      "sudo git clone https://github.com/yadvi12/Hadoop-configuration-files.git  /hdfs",
      "cd /hdfs",
      "sudo mv hdfs-site.xml core-site.xml /etc/hadoop",
      "sudo hadoop namenode -format -force",
      "sudo hadoop-daemon.sh start namenode",
     
    ]
  }
}



resource "null_resource" "nulllocal1"  {


depends_on = [
    null_resource.nullremote3,
  ]

	provisioner "local-exec" {
	    command = "start chrome  ${aws_instance.web.public_ip}:50070"
  	}
  }
