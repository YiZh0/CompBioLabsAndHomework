# Growth Analysis for Hawksbill Sea Turtles  in Anegada, British Virgin Islands

### Biological question
* Do wild hawksbill  sea  turtles  have  high growth rate? 
(Do hawksbill  sea  turtles grow well in wild?)
* How is the growth rate of wild hawksbill  sea  turtles compare to these in captivity and other turtles? (no captivity data. compare with green sea turtle)

### Context (introduction)

The hawksbill sea turtle is a Critically Endangered sea turtle. In order to know the situation of wild hawksbill sea turtle, ecologist collect the data from Anegada. In this project, I will visualize the growth data (size, weight  etc.) of hawksbill sea turtle in Anegada.


### Methods
##### The source of the data:
>###### References 
><font size=1>Hawkes LA, McGowan A, Broderick AC, Gore S, Wheatley D, White J, Witt MJ, Godley BJ (2014) High rates of growth recorded for hawksbill sea turtles in Anegada, British Virgin Islands. Ecology and Evolution 4(8): 1255-1266.
[https://doi.org/10.1002/ece3.1018](https://doi.org/10.1002/ece3.1018)</font>
>
><font size=1>Hawkes LA, McGowan A, Broderick AC, Gore S, Wheatley D, White J, Witt MJ, Godley BJ (2014) Data from: High rates of growth recorded for hawksbill sea turtles in Anegada, British Virgin Islands. Dryad Digital Repository. [https://doi.org/10.5061/dryad.27n36](https://doi.org/10.5061/dryad.27n36)</font>

The original study collected over 109 irregularly spaced days by  awkes LA, McGowan A, Broderick AC, Gore S, Wheatley D, White J, Witt MJ, Godley BJ. 

Goals of original study that produced the data are to estimate growth rate of juvenile hawksbill turtles around Anegada and to show the role of shallow water reef systems play in hawksbill turtles' growth. 

Researchers use the rodeo technique to capture hawksbill turtles within the vicinity of reefs. They tag these turtles, measure the size of them (cm), and weight them (kg). 

###### Comma separated values file (.csv)

###### This data set include: 
<font size=1>Date(char), ID(char), CCLnt(numerical), SCL(numerical), Weight(numerical), Water Column Depth(numerical), Easting(numerical), Northing(numerical)</font>

###### Size of data (i.e., megabytes, lines, etc.)
<font size=1>17.31KB
390 lines (include one heading line)
Include NA in dataset</font>

##### What the original authors did with the data:
* Plot capture points on map
* Plot frequency histogram of carapace length (CCL, n-t) for all hawksbill turtles on initial capture 
* Boxplots of growth rate and mass gain
* Show mass against carapace length (CCL)
* Plot fitted model and raw data of growth rate and mass gain as a function of carapace length at first capture.


##### What I did with the data: 
1. Analyze the growth rates
2. Visualize the growth rates with boxplot (growth rate comparison with green sea turtle based on size)
3. Plot frequency histogram of carapace length (CCL, n-t) for all hawksbill turtles (based on mean)
4. Visualize mass against carapace length (CCL)


##### Details:
1. Write a function to calculate the growth rate for each hawksbill turtle
2. Eliminate "bad" data (include rows with all CCLnt, SCL and Weight missing (NA) )
3. Count capture times for each hawksbill sea turtle and keep these appear more than once
4. Convert Date
5. For loop to calculate growth rate
6. Visualize using boxplot and ggplot

### Results and conclusions
![CCL growth rate](https://github.com/YiZh0/CompBioLabsAndHomework/blob/master/Final_Project/Assignment09/b1.png)
![SCL growth rate](https://github.com/YiZh0/CompBioLabsAndHomework/blob/master/Final_Project/Assignment09/b2.png)
![Weight growth rate](https://github.com/YiZh0/CompBioLabsAndHomework/blob/master/Final_Project/Assignment09/b3.png)
The hawksbill  sea  turtles have higher growth rate (SCL) than green sea turtle in general. The three figures correspond CCL growth rate, SCL growth rate (we mainly look at) and mass growth rate respectively (per year). 

![Frequency histogram of carapace length](https://github.com/YiZh0/CompBioLabsAndHomework/blob/master/Final_Project/Assignment09/H1.png)
It is a bell shape. Most hawksbill  sea  turtles' carapace length are 30 - 45 cm. 

![Mass vs. CCL scatter](https://github.com/YiZh0/CompBioLabsAndHomework/blob/master/Final_Project/Assignment09/Scatter1.png)
The hawksbill  sea  turtle's mass and CCL were exponentially correlated. 

In general, hawksbill  sea  turtles grow well in wild, I am happy to see that :)

<hr>

#### Comments

<font size=3>It is strange that as.POSIXlt(), as.Date() and strptime() do not work for the data, so I find a new way to convert date. 
It takes me time to figure out how to calculate growth rate for each sea turtle. It is not easy to deal all NA. Moreover, matching size, weight and date is a difficult job. 
Sadly, I cannot visualize the capture points on map because it is hard to use the Cartesian coordinates data the original data provided.  </font>
