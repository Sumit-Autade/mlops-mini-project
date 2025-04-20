# python version

FROM python:3.9

WORKDIR /app

COPY flask_app/ /app/

COPY models/vectorizer.pkl  /app/models/vectorizer.pkl

RUN pip install -r requirements.txt 

RUN python -m nltk.downloader stopwords wordnet

EXPOSE 5000

CMD ["gunicorn" , "-b", "0.0.0.0:5000", "app:app"]   
# this command is for gunicorn server so instead of flask which is not so production based server we are using gunicorn 
# flask accept only one request at a time but gunicorn work paralally
# CMD ["python" , "app.py"]