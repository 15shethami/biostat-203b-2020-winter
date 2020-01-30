*Ami Sheth*

### Overall Grade: 105/110

### Quality of report: 10/10

-   Is the homework submitted (git tag time) before deadline? 

    Yes. `Jan 24, 2020, 4:18 PM PST`.

-   Is the final report in a human readable format html? 

    Yes. `html` file. 

-   Is the report prepared as a dynamic document (R markdown) for better reproducibility?

    Yes. `Rmd`.

-   Is the report clear (whole sentences, typos, grammar)? Do readers have a clear idea what's going on and how are results produced by just reading the report? 

	Yes. 


### Correctness and efficiency of solution: 55/60

-   Q1 (10/10)

-   Q2 (17/20)

	\#4. 
	- (-1 pt) Note that you are including the header in counting the number of unique patients. You can use something like the following to remove the first line. 
	
	  ```
	  sed 1d ADMISSIONS.csv | awk -F ',' '{print $2}' | sort | uniq | wc -l
	  ```
	- (-2 pts) In your solution, the possible values taken by the variables include variables themselves. Remove the header before `awk` statement. e.g.
	
	```
	sed 1d ADMISSIONS.csv | awk -F, '{ print $10 }' | sort | uniq 
	```
	
	
-   Q3 (15/15)

	\#3. I think you meant lines 16-20. 


-  Q4 (13/15)
	
	\#3. 
	- (-1 pt) Wrong values for `dist=t5`. Lines 30-32 in `MSE_table_script.R` should be: 
	
	```
	t5_list <- NULL
	for (file in t5_files) {
	  t5_list[file] <- read(file)
	}
	```
	
	- (-1 pt) Use of `kable` to print the table is good, but table still appears crude on `html` document. 
	
	    
### Usage of Git: 10/10

-   Are branches (`master` and `develop`) correctly set up? Is the hw submission put into the `master` branch?

    Yes.

-   Are there enough commits? Are commit messages clear? 

    Yes. 18 commits for hw1. 

          
-   Is the hw1 submission tagged? 

    Yes. `hw1`. 

-   Are the folders (`hw1`, `hw2`, ...) created correctly? 

    Yes.
  
-   Do not put a lot auxiliary files into version control. 

	 Yes. 

### Reproducibility: 10/10

-   Are the materials (files and instructions) submitted to the `master` branch sufficient for reproducing all the results? Just click the `knit` button will produce the final `html` on teaching server? 

	Clicking knit button does not produce the final html on teaching server. R packages you are using (e.g. `formattable`, `knitr`) may not have been installed on your collaborator's account. Make sure your collaborators can easily run your code. You may use something like
	
	```R
	packages <- c("formattable", "knitr")
	if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  		install.packages(setdiff(packages, rownames(installed.packages())))  
}
	```
for easier reproducibility. 
	
-   If necessary, are there clear instructions, either in report or in a separate file, how to reproduce the results?

    Yes.

### R code style: 20/20

-   [Rule 3.](https://google.github.io/styleguide/Rguide.xml#linelength) The maximum line length is 80 characters. 


-   [Rule 4.](https://google.github.io/styleguide/Rguide.xml#indentation) When indenting your code, use two spaces.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place spaces around all binary operators (=, +, -, &lt;-, etc.). 	
	
-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place a space before a comma, but always place one after a comma. 

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place a space before left parenthesis, except in a function call.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place spaces around code in parentheses or square brackets.
