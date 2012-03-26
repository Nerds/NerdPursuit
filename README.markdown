[![Build Status](http://travis-ci.org/Nerds/NerdPursuit.png)](http://travis-ci.org/Nerds/NerdPursuit)

## NerdPursuit

Everybody loves question & answer games, but none of those let nerdism 
shine. This repo gathers nerd-questions, so everybody can play geeky  
questions-answer games and check the nerd level of your buddies.

## Participate

Simply fork this repo, add your questions and send us a pull request. 
Comment commits and pull requests or create a ticket.

Thanks to marcinbunsch, who created a commandline interface to create new 
questions(he hates writing json). Start it with:
    ./creator [sub_category]

## Tech

Questions are submitted in JSON, with one question per file and MUST 
align with our JSON-Schema. We have setup travis-ci which automatically 
tests all questions.

You should run the tests before sending us a pull-request:
    bundle install
    bundle exec ruby validate_all.rb

## How to Play

It is up to you on how to use questions. Just think of building yourself 
a web-based game or create a print-service middleware ...

## License
<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Dataset" property="dct:title" rel="dct:type">Nerdpursuit</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.<br />Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/Nerds/NerdPursuit" rel="dct:source">github.com</a>.