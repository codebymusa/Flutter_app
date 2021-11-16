all:	
	mvn clean
	mvn package
	sudo docker build -t quote-quote-server-0.0.1 .	
	sudo docker login -u mmashaba -p MstA7yYUvVvX8znc8iwN gitlab.wethinkco.de:5050
	sudo docker push gitlab.wethinkco.de:5050/mmashaba/qutequotes	
	sudo docker tag qute-quote-server-0.0.1 gitlab.wethinkco.de:5050/mmashaba/qutequotes