Design an automation deployed with GITHUB/GITLAB pipelines to create load balanced simple nginx hosted on 1 or more virtual machines on AWS or Azure with the following assumption :
 
1. CIDR retrieve from REST API https://FDQN/vend_ip return
{
  "ip_address":"192.168.0.0",
  "subnet_size":"/16"
}


2. Create subnets with size /24

we have used cicr range 192.168.0.0/24

3. Generate SSH key for VM credential

aws-console--ec2-keypaid-create key pair


4. Take into consideration CSP Best Practices such as security and resiliency

we provided security at load balancer and ec2
and also we provided high availiabity using load balancer.alo we can provide autoscalng if there is any health issue with the existing target group( due to timr contraint i havent implrmented)

5. Take into consideration coding/scripting practices

we have implemented terraform as IAC to provision aws infra (since i havent implemented any web application due to time contraint)

6. Leverage on native cloud metrics/logging for error handling
we have implemented datadog for monitoring

7. Can use bash/terraform/python/powershell for the stack, github or github for the IAC pipeline

we have used 
terraform,git hub and declarative pipeline
