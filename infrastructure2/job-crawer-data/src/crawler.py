from arbeitnowapi import load_jobs
from dynomodb_utilis import save_emails

def map_emails(jobs_from_api):
    emails = []
    for api_job in jobs_from_api:
        emails.append({
            "id": api_job["slug"],
            "title": api_job["title"],
            "description": api_job["description"],
        })
    return emails



def handler(event, context):
    jobs_from_api = load_jobs()
    emails = map_emails(jobs_from_api)
    save_emails(emails)


if __name__ == "__main__":
    handler({},{})