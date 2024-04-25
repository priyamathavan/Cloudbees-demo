This repo is created for two tier archietecture.
It contains Terraform codes you can use to learn how to create an AWS EC2 instance,ALB and AWS RDS DB instance.
## Step 1:
first you have to create a providers.tf file defining aws provider and region,version.
## Step 2:
create a backend.tf file specifying the s3 bucket and dynamo db table for state lock.
s3 bucket and dynamo db table i have created manually in aws console
## Step 3:
create a network.tf under compute module specify the components like VPC,IGW,SUBNETS,ROUTE TABLE,SECURITY GROUPS for ec2,ELB AND DB2 instances.

## Step 4:
create ec2.tf,elb.tf and rds.tf to create EC2,RDS AND ELB .

## Step 5:
create ssm paramter to secure db password .this i have created via aws CLI

## Step 6:
i have used data sources for SSM parameter and ami id for ec2 instance.

## Step 7:
once all created you do terraform init,terraform plan .

## Step 8:
reg the environment  i have created two workspaces named dev and prod.based on that i have used in terraform instance_type.

## Troubleshooting:
## when i do terraform plan i got the error as the public subnet2 overlaps with public subente1 hence i changed the value and i have done it.

using the above code i could able to create the terraform resources successfully.
