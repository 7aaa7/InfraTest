`The script accepts a region, type of instances to report and VPC, Default values are "us-east-1", "r5-large" and "default"`

```
 ➜ python3 report_instance.py --help                                                         
usage: report_instance.py [-h] [--region REGION] [--type TYPE] [--vpc VPC] [--profile PROFILE] [--list_vpcs]

optional arguments:
  -h, --help            show this help message and exit
  --region REGION, -r REGION
                        The Region to search
  --type TYPE, -t TYPE  The TYPE of instace to report
  --vpc VPC, -c VPC     The AWS VPC to search
  --profile PROFILE, -p PROFILE
                        The AWS credential profile
  --list_vpcs, -l       List all the VPCs
```

```
 
 ➜ python3 report_instance.py --list_vpcs --region ap-south-1                                
vpc-07f82473dd24853d7

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