es-hack-1000
============

Create an elasticsearch cluster in azure, host mongodb, get data from traackr, do something cool with maps.
Scale up.

##Setup servers
-Create github repo
-Go to azure portal and create some nods named cm-es-9200.cloudapp.net through cm-es-9204.cloudapp.net and make the node names be the same as the ports you're going to use
-setup mongodb on the first node

##Mongo DB
-http://docs.mongodb.org/manual/tutorial/install-mongodb-on-red-hat-centos-or-fedora-linux/
-Create a /etc/yum.repos.d/mongodb.repo file to hold the following configuration information for the MongoDB repository:

<pre>
[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
</pre>

Then "sudo su -"
and then
<pre>
yum install mongo-10gen mongo-10gen-server
</pre>

<pre>
mongo cluster-7-data-00.sl.hackreduce.net:28953/traackr
</pre>
<pre>
&gt; db.posts.find()
&gt; db.influencers.find()
</pre>

Install Mongo on windows. just download the 64 bit version, unpack the zip file and put mongo bin in your PATH.

<pre>
mvn package
mvn assembly:assembly
cluster-7-data-00.sl.hackreduce.net:28953

cd target
java -jar hackday*

java -jar hackday-mongo-loader.jar -c posts -d traackr -m cluster-7-data-00.sl.hackreduce.net:28953

cd java/mondo-data
mvn package; mvn assembly:assembly; java -jar target/hackday-mongo-loader.jar -c influencers -d traackr -m cluster-7-data-00.sl.hackreduce.net:28953 -o 10

</pre>

##Project Home

[here] (https://github.com/depahelix/es-hack-1000)

##Goal 1
git clone https://github.com/hackreduce/elasticsearch-hackathon
build the project with maven. see:
[elasticsearch-hackathon] (https://github.com/hackreduce/elasticsearch-hackathon)

##Goal 2
Index some data.

##Section 3

hack/reduce elasticsearch sept 2013





elasticsearch-hackathon
=======================

ElasticSearch Hackathon Material

## Prerequisites
All attendees:
- Git and git client (to download or share code)
- A GitHub account (to share your creations)
- Text editor or IDE of choice
- Either the [native Java Client](http://www.elasticsearch.org/guide/reference/java-api/) (see provided skeleton [Java ES Client project](https://github.com/hackreduce/elasticsearch-hackathon/tree/master/java/es-client) ), or an ElasticSearch client for the language of your choice: [http://www.elasticsearch.org/guide/clients/](http://www.elasticsearch.org/guide/clients/)

## ElasticSearch Installation

It's recommended that you download and play with Elasticsearch locally if only to get familiar with the basic commands.

[http://www.elasticsearch.org/guide/reference/setup/installation/](http://www.elasticsearch.org/guide/reference/setup/installation/)

## Available Datasets
### Elasticsearch Data
- Loaded on elasticsearch cluster on cluster-7-slave-00.sl.hackreduce.net (visual cluster representation can be seesn through the [ElasticSearch Head Plugin](http://cluster-7-slave-00.sl.hackreduce.net:9200/_plugin/head/))
- Two indices are available:
  - wikipedia: collection of english wikipedia articles and tweets. About 13 million records. Mapping: [https://gist.github.com/imotov/5169928](https://gist.github.com/imotov/5169928)
  - enron: collection of emails from Enron Email Dataset. About 0.5mln records. Mapping: [https://gist.github.com/imotov/5169937](https://gist.github.com/imotov/5169937)

### Traackr Data
This data is loaded in MongoDB so that you can re-index it into ES in any way you find interesting:

- Loaded on Mongo instance on cluster-7-data-00.sl.hackreduce.net
- Mongo URI: mongodb://cluster-7-data-00.sl.hackreduce.net:28953
- Database name: traackr
- Two collections are available:
  - posts: collection of articles and tweets. About 23 million records. JSON data structure: [https://gist.github.com/gpstathis/5170137](https://gist.github.com/gpstathis/5170137)
  - influencers: collection of authors corresponding to the articles in the “posts” collection. About 85K records. JSON data structure: [https://gist.github.com/gpstathis/5170171](https://gist.github.com/gpstathis/5170171)

## Useful Links
### Elasticsearch Clients
- [Ruby, Python, PHP, Perl](http://www.elasticsearch.org/blog/unleash-the-clients-ruby-python-php-perl/)
- [Everything else](http://www.elasticsearch.org/guide/clients/)

### Elasticsearch Plugin Examples
- [Plugin Directory](http://www.elasticsearch.org/guide/reference/modules/plugins.html)
- [Native Script](https://github.com/imotov/elasticsearch-native-script-example)
- Analysis - [https://github.com/elasticsearch/elasticsearch-analysis-icu](https://github.com/elasticsearch/elasticsearch-analysis-icu), [https://github.com/spinscale/elasticsearch-opennlp-plugin](https://github.com/spinscale/elasticsearch-opennlp-plugin)
- [River](https://github.com/elasticsearch/elasticsearch-river-wikipedia)
- [REST API](https://github.com/imotov/elasticsearch-just-source)
- [Script Facets](https://github.com/imotov/elasticsearch-facet-scripts)

### Indexing Data into Elasticsearch
- [CSV data loader (Ruby)](https://gist.github.com/karmi/5135885#file-import-rb)
- [JSON data loader (Ruby)](https://github.com/karmi/tire-contrib/tree/importer/lib/tire/importer)
- [CSV data loader (Perl)](https://gist.github.com/clintongormley/5136749)
- [JSON data loader (Clojure)](https://github.com/elasticsearch/stream2es)
- [Enron data loader (Python)](https://github.com/imotov/elasticsearch-test-scripts/tree/master/enron)

### Loading data from MongoDB
- Two skeleton projects are availalbe to get you up and running right away: [Java](https://github.com/hackreduce/elasticsearch-hackathon/tree/master/java/mongo-data) or [Python](https://github.com/hackreduce/elasticsearch-hackathon/tree/master/python/mongo-data)
- [Using the Java driver](http://docs.mongodb.org/ecosystem/tutorial/getting-started-with-java-driver/)
- [Java Driver Examples Code](https://github.com/mongodb/mongo-java-driver/blob/master/examples/QuickTour.java)
- [Using the Python driver](http://docs.mongodb.org/ecosystem/drivers/python/)
- [Python driver tutorial](http://api.mongodb.org/python/current/tutorial.html)
- How to connect to the Hack/Reduce MongoDB Shell via local client:
  * Install MongoDB in your local environment
    * Ubuntu / Debian: `sudo apt-get update; sudo apt-get install mongodb`
    * Fedora / RedHat: `sudo yum install mongodb`
    * Test if installed successfully: `mongo --version`
    * Connect to Mongo instance on cluster-7-data-00.sl.hackreduce.net: `mongo cluster-7-data-00.sl.hackreduce.net:28953/traackr`
