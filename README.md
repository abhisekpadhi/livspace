# :paintbrush: Interior Design Recommender
This project holds the source for the recommender system created for livspace hackathon

# :question: What is recommender system?
- A system that profiles customers interior design requirements.
- The system matches the customer profile with designs by classifying and tagging designs and recommends desings.

# :gear: What is this built with?
1. `Python3`
2. `Django`
3. `MySql`

# :rocket: How to get started?
- Clone this repo
```
https://github.com/abhisekpadhi/livspace.git
```

- Setup virtualenv

```
cd insuretech_bot/
virtualenv --python=python3 venv
```

- Activate virtualenv

```
source venv/bin/activate
```

- Install dependencies

```
pip install -r requirements
```

- Setup database
```
mysql -u <username> -p<password>
mysql> CREATE DATABASE IF NOT EXISTS `livspace`;
mysql> exit
```

- Run migrations
```
python manage.py makemigrations
python manage.py migrate
```

- Dump dummy data (optional)
```
mysql -u <username> -p<password> livspace < livspace_data.sql
```

- Start application
```
python manage.py runserver localhost:8000
```

# :smiley: API's

## Questions API
- User requirement profiling with a questionnaire.

```
curl -X GET \
  http://localhost:8000/api/questions/ \
  -H 'Content-Type: application/json'
```
*response:*
```
{
    "status": "success",
    "message": {
        "questions": [
            ...
            {
                "question": [
                    {
                        "id": 1,
                        "text": "What is your age bracket from following ?",
                        "type_for_customer": "single-select",
                        "name": "age",
                        "type_for_designer": "multiple-select"
                    }
                ],
                "choice": [
                    {
                        "id": 1,
                        "question": 1,
                        "text": "30-50",
                        "is_inactive": false
                    },
                    {
                        "id": 2,
                        "question": 1,
                        "text": "50-70",
                        "is_inactive": false
                    },
                    {
                        "id": 3,
                        "question": 1,
                        "text": "70+",
                        "is_inactive": false
                    }
                ]
            }
            ...
        ]
    }
}
```

- Receive answers
```
curl -X POST \
  http://127.0.0.1:8000/api/questions/ \
  -H 'Content-Type: application/json' \
  -d '{
	"user_id": 1,
	"tags": [{"question": 1, "choice": 1}]
}'
```

*response*

```
{
    "status": "success",
    "status_message": "User created."
}
```

- Updata a user
```
curl -X PUT \
  http://localhost:8000/api/v1/users/ \
  -H 'Content-Type: application/json' \
  -d '{
	"email": "test@google.com",
	"phone_number": "+91943983125"
	}'
```

*response*

```
{
    "status": "success",
    "message": {
        "designs": [
            {
                "id": 1,
                "image_url": "http://127.0.0.1:8000/static/images/Vittoria-Orlandi-6.jpg"
            },
            {
                "id": 3,
                "image_url": "http://127.0.0.1:8000/static/images/Vittoria-Orlandi-6_JoAAJqx.jpg"
            },
            {
                "id": 4,
                "image_url": "http://127.0.0.1:8000/static/images/Vittoria-Orlandi-6_lC4nMY5.jpg"
            },
            {
                "id": 5,
                "image_url": "http://127.0.0.1:8000/static/images/3D-Interior-Design-Service-Contractorbhai-Modern-Design-4-400x265.jpg"
            },
            {
                "id": 6,
                "image_url": "http://127.0.0.1:8000/static/images/T.jpg"
            },
            {
                "id": 7,
                "image_url": "http://127.0.0.1:8000/static/images/M.jpg"
            },
            {
                "id": 8,
                "image_url": "http://127.0.0.1:8000/static/images/royal-bedroom.jpg"
            }
        ]
    }
}
```

## Designer API
- Build desing tags mapping with input from desinger.

```
curl -X POST \
  http://10.2.41.106:8000/api/designers/ \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
  -F image_file=@/Users/abhisek.padhi/Desktop/livspace/royal-bedroom.jpg \
  -F user_id=1 \
  -F 'tags[]={"question": 1, "choice": 1}'
```

*response*

```
{
    "status": "success",
    "message": "Updated design tag mapping."
}
```