variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-2 = "ami-06878d265978313ca" #Ubntu
    us-east-1 = "ami-06878d265978313ca"
    us-east-3 = "ami-02a2700d37baeef8b"
  }
}

variable "SSH_KEY" {
  default = "test"
}

variable "PUB_KEY_PATH" {
  default = "test.pub"
}

variable "PRIV_KEY_PATH" {
  default = "test"
}

variable "USERNAME" {
  default = "ubuntu"
}

variable "MYIP" {
  default = "1.163.225.172/32"
}

variable "rmquser" {
  default = "rabbit"
}

variable "rmqpass" {
  default = "!Coasts92442"
}

variable "dbuser" {
  default = "admin"
}

variable "dbpass" {
  default = "admin123"
}

variable "dbname" {
  default = "accounts"
}

variable "instance_count" {
  default = "1"
}

variable "VPC_NAME" {
  default = "vprofile-VPC"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}

variable "VpcCIDR" {
  default = "172.21.0.0/16"
}

variable "PubSub1CIDR" {
  default = "172.21.1.0/24"
}

variable "PubSub2CIDR" {
  default = "172.21.2.0/24"
}

variable "PubSub3CIDR" {
  default = "172.21.3.0/24"
}

variable "PrivSub1CIDR" {
  default = "172.21.4.0/24"
}

variable "PrivSub2CIDR" {
  default = "172.21.5.0/24"
}

variable "PrivSub3CIDR" {
  default = "172.21.6.0/24"
}



