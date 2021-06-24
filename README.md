This repository is used to build and perform some SQL requests to MySQL database.

First of all, add update configuration in **config.yml**

**The repository has 3 classes**: People, Worker and Engineer. You can add your own classes and inherit methods from People class.

*Worker* and *Engineer* classes are used for retrieving all records from the people table whose type is 'worker' and 'engineer' correspondingly.

Engineer class has methods:

- ``Engineer.all`` => returns the array of all people with status *'engineer'*;
- ``Engineer.find(id)`` => returns the first *engineer by id*;
- ``Engineer.join_all`` => returns the array of all people with status *'engineer'* with corresponding **ids of groups**.

*The same methods for Worker class and all future ancestors of People class.*


To pass rspec tests the database should have the table *people* that has fields:
- id
- name
- surname
- type

And has 2 records with type *engineer* and 1 record with type *worker*.

To perform spec tests run in Terminal:

``$ rspec``

To retrieve separately all engineers and all workers run in Terminal:

``$ ruby test.rb``
