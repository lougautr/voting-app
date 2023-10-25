<h1>Voting application to choose your favorite animal</h1>

<h3>Authors:</h3>
<ul>
  <li>Antonin Montagne</li>
  <li>Lou-Anne Gautherie</li>
</ul>

<h3>Change in source code:</h3>

We have replaced all the 'localhost' of the configuration files '/vote/app.py', '/worker/Progam.cs' and '/result/server.js' 
with 'redis' or 'postgres' depending on the need. . We couldn't leave 'localhost' because in a Docker container, 'localhost' 
refers to the container itself, not the host machine.

We also changed the front (by slipping a little easter egg into the voting results).
