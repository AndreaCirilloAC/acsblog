---
author: andreacirilloac
comments: true
date: 2014-11-05 04:40:02+00:00


slug: best-pratice-for-scientific-computing
title: Best Practices for Scientific Computing

tags:
- analytics
- computer science
- data analytics
- R
---

I reproduce here below principles from the amazing paper [Best Practices for Scientific Computing](http://arxiv.org/pdf/1210.0530v3.pdf), published on 2012 by a group of US and UK professors. The main purpose of the paper is to "teach"  good programming habits shared from professional developers to people  that weren't born developer, and became developers just for professional purposes.


<blockquote>Scientists spend an increasing amount of time building and using software. However, most scientists are never taught how to do this efficiently</blockquote>




## Best Practices for Scientific Computing





	
  1. 


#### Write programs for people, not computers.



	
    1. _a program should not require its readers to hold more than a handful of facts in memory at once_

	
    2. _names should be consistent, distinctive and meaningful_

	
    3. _code style and formatting should be consistent_

	
    4. _all aspects of software development should be broken down into tasks roughly an hour long<!-- more -->_




	
  2. 


#### Automate repetitive tasks.



	
    1. _rely on the computer to repeat tasks_

	
    2. _save recent commands in a file for re-use_

	
    3. _use a build tool to automate scientific workflows_




	
  3. 


#### Use the computer to record history.



	
    1. _software tools should be  used to track computational work automatically_




	
  4. 


#### Make incremental changes.



	
    1. _work in small steps with frequent feedback and course correction_




	
  5. 


#### Use version control.



	
    1. _use a version control system_

	
    2. _everything that has been created manually should be put in version control_




	
  6. 


#### Don’t repeat yourself (or others).



	
    1. _every piece of data must have a single authoritative representation in the system_

	
    2. _code should be modularized rather than copied and pasted_

	
    3. _re-use code instead of rewriting it_




	
  7. 


#### Plan for mistakes.



	
    1. _add assertions to programs to check their operation_

	
    2. _use an off-the-shelf unit testing library_

	
    3. _use all available oracles when testing programs_

	
    4. _turn bugs into test cases_

	
    5. _use a symbolic debugger_




	
  8. 


#### Optimize software only after it works correctly.



	
    1. _use a profiler to identify bottlenecks_

	
    2. _write code in the highest-level language possible_




	
  9. 


#### Document design and purpose, not mechanics.



	
    1. _document interfaces and reasons, not implementations_

	
    2. _refactor code instead of explaining how it works_

	
    3. _embed the documentation for a piece of software in that software_




	
  10. 


#### Collaborate.



	
    1. _use pre-merge code reviews_

	
    2. _use pair programming when bringing someone new up to speed and when tackling particularly tricky problems_





<!-- more -->

if you want to discover more, you can download your copy of Best Practice Scientific Computing here below


#### [donwload a copy of Best Practices for Scientific Computing](http://arxiv.org/pdf/1210.0530v3.pdf)
