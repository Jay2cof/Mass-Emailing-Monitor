from fastapi import FastAPI

app = FastAPI()



@app.get("/")
def Health():
    return {"Health": "ok"}

@app.get("/job")
def getjob():
    return [{
        "id": "uid1",
        "title": "Nice Job",
        "description": "super nice job"
    }, {
        "id": "uid2",
        "title": "Nice Job2",
        "description": "super nice job2"
    }]

