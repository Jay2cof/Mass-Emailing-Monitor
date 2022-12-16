from http.client import HTTPException
from fastapi import FastAPI
import uvicorn

app = FastAPI()


emails = [{
        "topic": "jobs emails",
        "address" : "jaytest@de.aol",
        "detail" : "new jobs with positions"
    },{
        "topic": "salary emails",
        "address" : "fredtest@de.aol",
        "detail" : "salary deatils"
    },{
        "topic": "workers benefit emails",
        "address" : "charls@de.aol",
        "detail" : "new benefits list"
    }]


@app.get("/email")
def emaillist():
    return emails

@app.get("/emails/{topic}")
def emaillist(topic):
    for email in emails :
        if email["topic"] == topic:
            return email      
    raise HTTPException(status_code=404,detail="email with topic" + topic + "not found")         

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=80)
