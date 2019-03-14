# R script for logistic growth model function

This markdown document is the metadata file that explains the [R script from Lab08](https://github.com/YiZh0/CompBioLabsAndHomework/blob/master/Labs/Lab08/Zhou_Lab8.R).   
This R script include the function that stores all the prediction data gain from logistic growth model using for loop, and makes a plot of the results. 

The function take arguments:   
* r(the intrinsic growth rate)
* K(the carrying capacity)
* t(the total number of generations)
* p(the initial population size)

The function include two important vectors, one called "time" that stores the time steps, and one called "abundance" that stores the data on population abundances predicted from the discrete-time logistic equation.


>Here is the discrete-time logistic growth equation, used in many models of population abundance over time:
>
>	`n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )`
>
>where `n[t]` is the abundance of the population at time `t`, `n[t – 1]` is the abundance of the population in the previous time step, `r` is the intrinsic growth rate of the population, and `K` is the environmental carrying capacity for the population.  Suppose that right now is time 1 (i.e., the current time step is `t = 1`).  **If `n[1] = 2500, K = 10000, and r = 0.8`, then what do you predict for the value of `n[12]`?**  Write a for loop that answers this question and that also prints out the abundance of the population each time step.

Final, the script will writes the data set to a file which have two columns: the first column "generations", and the second column "abundance".


### Example  
In the R script, there is an example with r: 0.8, K: 10000, t: 12, p: 1500
Result data is saved in [myfile.csv](https://github.com/YiZh0/CompBioLabsAndHomework/blob/master/Labs/Lab08/myfile.csv )
![abundance over time](https://github.com/YiZh0/CompBioLabsAndHomework/blob/master/Labs/Lab08/example_plot.png)
