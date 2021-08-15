`The script accepts a region, type of instances to report and VPC, Default values are "us-east-1", "r5-large" and "default"`

```
 ➜ python3 report_instance.py --list_vpcs --region ap-south-1
vpc-0e294255bc7c49128

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
vpc-0e294255bc7c49128

 ➜ python3 report_instance.py --vpc vpc-0e294255bc7c49128 --type r5.large  --region ap-south-1
Reporting instances for Region ap-south-1 , Type:  r5.large , VPC:  vpc-0e294255bc7c49128 

+-------------------+---------------------+
| Instance Name     | Instance ID         |
+===================+=====================+
| prod-web-server-1 | i-0a6c2853d37226e0c |
+-------------------+---------------------+
| prod-web-server-2 | i-0bab3151f17e833c0 |
+-------------------+---------------------+
 
 ➜ 

```