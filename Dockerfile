FROM python:3.11-slim

WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install the PostgreSQL dialect for SQLAlchemy
RUN pip install psycopg2-binary

# Run pytest to test the application
RUN pytest

EXPOSE 8000

CMD ["fastapi","run","src","--port","8000","--host","0.0.0.0"]
