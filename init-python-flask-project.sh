mkdir $1
echo "Step (1/5): Project" $1 "created!\n"

cd $1

echo "''' Import Libraries '''

from flask import Flask, render_template, request, redirect, url_for, jsonify
import requests
import os
import json

''' Initialize Flask Variables '''

app = Flask(__name__)

''' Default Route '''

@app.route('/')
def index():
    return render_template('index.html')

''' Start the Server '''

port = os.getenv('VCAP_APP_PORT', '8080')
if __name__ == \"__main__\":
    app.secret_key = os.urandom(12)
    app.run(debug=True, host='0.0.0.0', port=port)

" > app.py

echo "  applications:
  - name: flask-app
    random-route: true
    memory: 256M" > manifest.yml

echo "web: python app.py" > Procfile

echo "FLASK==1.1.1
Flask-Cors==3.0.8
requests" > requirements.txt

echo "python-3.6.9" > runtime.txt

echo "FROM ubuntu:16.04

LABEL maintainer=\"Manoj Jahgirdar <manoj.jahgirdar@in.ibm.com>\"

RUN apt-get update
RUN apt-get install -y python3 python3-dev python3-pip

COPY ./ ./app
WORKDIR ./app

RUN python3 -m pip install pip --upgrade
RUN python3 -m pip install wheel

RUN pip3 install -r requirements.txt

CMD python3 app.py" > dockerfile

echo "Step (2/5): directory initialized with app.py, manifest.yml, Procfile, runtime.txt, dockerfile and requirements.txt\n"

mkdir templates && cd templates

echo '<!DOCTYPE html>
<html>

<head>
    <title>Flask App</title>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="static/css/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="static/carbon-components/css/carbon-components.min.css">
    <link rel="stylesheet" href="static/css/style.css">

</head>

<body>
    <nav class="bx--header">
        <a class="bx--header__name" href="javascript:void(0)" title="">
            <span class="bx--header__name--prefix">
            IBM
            &nbsp;
        </span> Code Pattern
        </a>
    </nav>

    <div class="custom-container">
        <div class="bx--grid">
            <div class="bx--row">
                <div class="bx--col-lg-12">
                    <div class="outside">
                        <div class="inside">
                            <h2>Congrats on creating your project: "'$1'"!</h2>
                            <p><code> HAPPY CODING < /></code> <br>script written by <a href="https://www.linkedin.com/in/manoj-jahgirdar-6b5b33142/">Manoj Jahgirdar</a>.</p>
                            <br>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="static/carbon-components/scripts/carbon-components.min.js"></script>
<script src="static/javascript/script.js"></script>

</html>' > index.html

echo "Step (3/5): templates directory created and initialized with index.html\n"

cd ../

mkdir static && cd static

mkdir carbon-components && cp -a ../../carbon-components-library/carbon-components/. carbon-components/ 

mkdir carbon-icons && cp -a ../../carbon-components-library/carbon-icons/. carbon-icons/ && echo "Step (4/5): carbon-components installed\n"

mkdir css && cd css

echo ".custom-container {
    margin-top: 5%;
    margin-left: 3%;
    margin-right: 3%;
}" > style.css

cd ../

mkdir javascript && cd javascript && touch script.js

echo "Step (5/5): static/css/style.css static/javascript/script.js created\n"

cd ../../

echo "\nThings you can do: \n1. cd $1 to go to the newly created directory...\n2. code $1 to open visual studio code and start coding...\n3. open $1 to open in finder...\n\nH A P P Y     C O D I N G!\n-script written by Manoj Jahgirdar\n"

echo "Automatically starting the Flask Server in 5 sec... press control + c to stop\n"

sleep 5

echo "Opening VS CODE\n"

code .

echo "Installing Virtualenv\n"

pip3 install Virtualenv

echo "\nStarting Flask Server...\n"

Virtualenv venv && source venv/bin/activate

pip install -r requirements.txt && python app.py