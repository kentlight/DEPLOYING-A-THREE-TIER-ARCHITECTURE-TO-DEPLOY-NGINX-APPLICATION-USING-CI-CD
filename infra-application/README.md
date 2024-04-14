# DEPLOYING A THREE TIER ARCHITECTURE TO DEPLOY NGINX APPLICATION USING CI/CD

<!-- 
![architecture diagram](/Images/application%20image.jpg){: .center-image } -->

<p align="center">
  <img src="./Images/application image.jpg" alt="architecture diagram">
</p>

The three-tier architecture with a load balancer, autoscaling for the web and application tiers, and a web, application, and database tier in separate subnets. In order to provide SSH access to the instances and internet connectivity, a Bastion Host and Nat Gatway were established. The procedure was made simple to replicate and reuse by using Terraform modules. 

By dividing the various layers and establishing a highly available, secure, and scalable infrastructure, this deployment will guarantee that all of the layers are in communication with one another. Relational databases (RDS), Auto Scaling Groups (ASG), Elastic Load Balancers (ELB), and Amazon Virtual Private Clouds (VPC) are all part of the architecture. A NAT gateway and bastion host will be set up in the public subnets for the Web tier. 

- Our point of access to the underlying infrastructure will be the bastion host. By concealing the secret IP addresses of the private instances from the public internet, the NAT Gateway will enable communication between our private subnets and the internet while preserving a certain amount of security. 

- This repo will help build a backend autoscaling group for our backend application and an internet-facing load balancer in the application tier to route internet traffic to the autoscaling groups in the private subnets. 

- Integrated in the repo is a script to install and run a Node.js and react.js application on the backend and the nginx webserver on the front end. Another layer of private subnets will house a MySQL database in the database tier, which will eventually be accessible via Node.js.
