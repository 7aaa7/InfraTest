import argparse
import boto3
import logging

def parse_args():
    parser = argparse.ArgumentParser(add_help="report instances from AWS given a VPC ID, instance type and region")    
    parser.add_argument('--region','-r', help="The Region to search", default="us-east-1")
    parser.add_argument('--type','-t', help="The TYPE of instace to report", default="r5-large")
    parser.add_argument('--vpc','-c', help="The AWS VPC to search", default="default")
    parser.add_argument('--profile','-p', help="The AWS credential profile", default="default")
    parser.add_argument('--list_vpcs', '-l', help="List all the VPCs", required=False, action='store_true')
    args = parser.parse_args()
    return(args)

def report_vpcs(args): 
    region = args.region
    session = boto3.session.Session(region_name = region, profile_name = args.profile)
    vpc = session.client('ec2')
    response = vpc.describe_vpcs()
    if (response['Vpcs']): 
        vpcs = response['Vpcs']
        for vpc in vpcs: 
            print(vpc["VpcId"])
    else: 
        print("NO VPC FOUND in region: ", region, ", with profile: ", args.profile)

def report_servers(args): 
    region = args.region
    type = args.type
    vpc = args.vpc 
    print("Reporting instances for Region", region, ", Type: ", type, ", VPC: ", vpc, "\n")
    session = boto3.session.Session(region_name = region, profile_name = args.profile)
    ec2 = session.client('ec2')
    filters = [ 
        { 'Name': 'instance-type', 'Values': [type] },
        { 'Name': 'vpc-id', 'Values': [vpc]}
    ]
    response = ec2.describe_instances( Filters = filters )
    print_servers(response)

def print_servers(response): 
    instances_got = []
    if (response['Reservations']): 
        reservations = response['Reservations']
        for reservation in reservations: 
            if ("Instances" in reservation):
                instances = reservation["Instances"]
                for instance in instances: 
                    name = get_instance_name(instance['Tags'])
                    id = instance["InstanceId"]
                    instances_got.append([name, id])   
            else: 
                print("No Instances found")
        display_instance_table(instances_got)
    else: 
        print("No Reservation found from the boto3 response")

def display_instance_table(instances): 
    try: 
        from tabulate import tabulate
        print(tabulate(instances, ["Instance Name", "Instance ID"], tablefmt="grid"))
    except: 
        logging.warning("No tabulate package found on this machine, pretty printing the details\n\n")
        print(instances)

def get_instance_name(tags):
    for tag in tags: 
        if tag['Key'] == 'Name':
            instance_name = tag['Value']
            return(instance_name)
    return ""
def set_logging_config(config, logger = logging): 

    if logger.__name__ == "logging":
        logger.basicConfig(**config)

if __name__ == "__main__":
  args = parse_args()
  set_logging_config({'level': logging.WARN})
  if (args.list_vpcs): 
    report_vpcs(args)
  else:
    report_servers(args)



