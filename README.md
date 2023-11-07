<h1>Voting application to choose your favorite animal</h1>

<h3>Authors:</h3>
<ul>
  <li>Antonin Montagne</li>
  <li>Lou-Anne Gautherie</li>
</ul>

<h2>Project link: https://github.com/AntoninMontagne/voting-app.git</h2>

<h2>Project presentation</h2>

It's an application that has two web interfaces.
The first allows you to vote for one of the two options, and the second allows you to view the result of the vote.<br>

The project consists of three distinct modules:
<ul>
  <li>Voting: This is a Python web application that allows users to vote for one of two available options.</li>
  <li>Worker: This service is developed in .NET. It retrieves votes from a Redis instance and saves them in a PostgreSQL database.</li>
  <li>Result: It is a Node.js web application that displays voting results in real time.</li>
</ul>

In addition to these three modules, the application is based on two other essential components:

<ul>
  <li>PostgreSQL: An instance of this database is used to store votes recorded by the Worker service.</li>
  <li>Redis: An instance of Redis is used to route votes between the different components of the application, ensuring their efficient and secure transmission.</li>
</ul>

This application was launched with several bash scripts. To make it cleaner and simpler to run, we decided to use Docker.<br>

We therefore wrote a Dockerfile for each module (vote, worker and result) and a docker-compose.yml which is located at the root and which allows you to run the three Dockerfiles while downloading the necessary images and setting up the bases of data and the dependencies between each service.<br>

The project is now launched with this command (to be able to run the project several times):
docker compose up --build --force-recreate<br>

To vote, simply go to the url 'localhost:8080', and to the url 'localhost:8081' to view the results.

<h3>All Dockerfile(s)</h3>
To write all the Dockerfiles, we adopted the behavior of the scripts.<br>
For all images, we have chosen to use a version older than the latest to ensure the application works.<br>
We decided to use a '/app' directory to work.

<h3>vote/Dockerfile</h3>
We opted for the exclusive copy of the requirements.txt file in order to optimize the installation of dependencies and improve layer caching.

<h3>worker/Dockerfile</h3>
We decided to make our Dockerfile multi-stage to be able to separate the build and execution phase. By doing this, our final stage only contains the executable and is therefore more optimized, faster, less cumbersome.

<h3>result/Dockerfile</h3>
We chose to use the production environment rather than the development environment to optimize performance.
We also chose to omit the installation of development dependencies for performance reasons.
We created a node user (other than root) for security reasons.

<h3>docker-compose</h3>
We used volumes of type "volume" to be able to store database information. We chose this type because we don't need to directly interact with or visualize the data.<br>
To probe the status of containers, we use wget. The wget allows you to check if the application is in service. We add the options --no-verbose to only retrieve error messages, --tries=1 to avoid infinite tries and --spider to not download the pages. The objective is only to check if the page is there.

<h3>Change in source code:</h3>

We have replaced all the 'localhost' of the configuration files '/vote/app.py', '/worker/Progam.cs' and '/result/server.js' 
with 'redis' or 'postgres' depending on the need. . We couldn't leave 'localhost' because in a Docker container, 'localhost' 
refers to the container itself, not the host machine.<br>

We also changed the front (by slipping a little easter egg into the voting results).

