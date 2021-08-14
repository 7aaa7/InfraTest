import argparse
import boto3


def parse_args():
    parser = argparse.ArgumentParser(add_help="report instances from AWS given a VPC ID, instance type and region")    
    parser.add_argument('--region','-r', help="The Region to search", default="us-east-1")
    parser.add_argument('--type','-t', help="The TYPE of instace to report", default="m5-large")
    parser.add_argument('--vpc','-c', help="The AWS VPC to search", default="default")
    args = parser.parse_args()
    return(args)

def report_servers(args): 
    pass

if __name__ == "__main__":
  args = parse_args()



