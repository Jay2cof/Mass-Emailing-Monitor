import boto3
import os

dynamodb = boto3.resource('dynamodb')

email_monitor_name = os.getenv('EMAIL-MONITOR_NAME')

email_table = dynamodb.Table(email_monitor_name)


def save_email(email):
    email_table.put_item(Item = email)

def save_emails(emails):
    for email in emails:
        save_email(email)
