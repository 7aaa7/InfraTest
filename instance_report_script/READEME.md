```
 aaa@Saurabhs-MacBook-Pro  ~/3w3/Practice/terraformTest/instance_report_script   main ±
 ➜ python3 report_instance.py --list_vpcs --region ap-south-1                                
vpc-07f82473dd24853d7
 aaa@Saurabhs-MacBook-Pro  ~/3w3/Practice/terraformTest/instance_report_script   main ±
 ➜ python3 report_instance.py --region ap-south-1 --type r5.large --vpc vpc-07f82473dd24853d7
Reporting instances for Region ap-south-1 , Type:  r5.large , VPC:  vpc-07f82473dd24853d7 

+-------------------+---------------------+
| Instance Name     | Instance ID         |
+===================+=====================+
| prod-web-server-1 | i-0db9460615c2351a0 |
+-------------------+---------------------+
| prod-web-server-0 | i-07c334207011ee920 |
+-------------------+---------------------+
```