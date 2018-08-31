import json, pprint, requests, textwrap, time, sys

headers = {'Content-Type': 'application/json'}

def openSession(host):
    data = {'kind': 'pyspark'}
    r = requests.post(host + '/sessions', data=json.dumps(data), headers=headers)
    session_url = host + r.headers["Location"]
    # Once the session has completed starting up, it transitions to the idle state:
    r = requests.get(session_url, headers=headers)
    while r.json()["state"] == "starting":    
        time.sleep(1)
        sys.stdout.write('.')
        sys.stdout.flush()
        r = requests.get(session_url, headers=headers)
    return session_url

def closeSession(session_url):
    requests.delete(session_url, headers=headers)

def execStatement(host, session_url, code, files=None):
    statements_url = session_url + '/statements'
    data = {'code': code}
    r = requests.post(statements_url, data=json.dumps(data), headers=headers)
    statement_url = host + r.headers['Location']
    r = requests.get(statement_url, headers=headers)
    while r.json()["state"] in ["waiting", "running", "cancelling"]:    
        time.sleep(1)
        sys.stdout.write('.')
        sys.stdout.flush()
        r = requests.get(statement_url, headers=headers)
    return r

