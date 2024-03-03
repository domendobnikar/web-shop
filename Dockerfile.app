# Use an official Python runtime as a parent image
FROM python:3.10

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install dependancies
RUN apt-get install -y pip3
RUN pip3 install django && \
    pip3 install djongo

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app/

# Install any needed packages specified in requirements.txt
# RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose port 8000 to the outside world
EXPOSE 8000

# Run django app when the container launches
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]