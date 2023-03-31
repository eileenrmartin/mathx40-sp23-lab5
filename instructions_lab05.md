# Lab 5: MPI Collective Communications for Distributed Vector Norm Calculation
### MATH 440/540, Spring 2023
### Due 11:59 PM, Mon. Apr. 3, 2023 (grace period Apr. 4)
### To be done in class Fri. Mar. 31, 2023

In this lab you will learn to use MPI collective communication calls to work with distributed vectors using the MPI programming model. You are provided a starter code with point-to-point communications (MPI sends and receives) which distributes a vector, calculate the L1 norm (sum of absolute values of all entries) of the distributed vector, and then sends a copy of this norm to all processes. In this lab, you will replace the point-to-point communications with MPI collective communication calls: a scatter, a reduce, and a broadcast. 

### Collaboration and References
This is intended to be done in groups of 2. A group of 3 will be allowed if someone is unable to find a partner. Instructions for the group of 3 are the same as all others. For full credit, all group members are expected to contribute approximately equally (GitHub displays number of lines contributed). One repository is to be submitted per group. If your group discusses this lab with another group, you may not copy any code from that collaborator's screen, but may discuss general concepts and share references. You must list every classmate you collaborate with in your references.md file.

### Deliverables
For this assignment, you will create/modify/use the following files. You will submit them by pushing to your Github repository that was automatically created when you accepted the link from Canvas. Note that this will create an empty repository for you (to avoid the GitHub Classroom issue w/ template repos), and you'll need to clone and add your starter code to the repo.
1. **code/serialVector.c** with function implementations related to setup, norm calculation, and teardown of an entire serial vector on a process. This is provided and will not be modified.
2. **code/serialVector.h** with function prototypes related to setup, norm calculation, and teardown of an entire serial vector on a process. This is provided and will not be modified. 
3. **code/parallelVector.h** with prototypes related to setup, norm calculation and teardown of a distributed vector. This is provided and will not be modified.
4. **code/parallelVector.c** with function implementations for setup, (the skeleton of) norm calculation and teardown of a distributed vector. This is provided and you will modify the scatterVector() and parallelNorm() functions.
5. **code/test.c** the main function you will use to test your implementation. This is provided and will not be modified.
6. **code/test.sh** the job submission script you will use to run your tests. This is provided and will not be modified.
7. **writeup/writeup.md** a markdown file where you will write up your results, **must include your name at the top (since GitHub username is different)**
8. **writeup/references.md** a markdown file where you will write a list of your collaborators and any references you used. If you worked with a partner, you must include the breakdown of your contributions here.


Note: no binaries should be uploaded to Github. Points will be deducted if they are present. 

### Instructions
1. **Setup:** Log into your account on Mio. Clone the starter code with two subdirectories inside: **code/** and **writeup/** . The files that you will have in each of these subdirectories is listed in the Deliverables section above. You are expected to regularly use git to commit code changes with comments and push those changes. 

2. **Review the provided code:** You are provided with definitions of serial and distributed vectors, and functions to take a serial vector stored on one process and distribute it approximately evenly over all processes. 

Note that in this lab, the provided code pads the serial vector with 0s at the end so that the  number of entries in the whole vector is evenly divisible by the number of processes. 

3. **Distribute the serial vector across many processes:** Fill in the scatterVector() function to scatter the data from a serial vector on a single process to smaller parallel vectors on all processes. Note that it takes three arguments, where the vecS argument is assumed to be initialized on the root process, the vecP argument is assumed to be initialized on all processes, and the root argument specifies the rank of the process that has the serial vector initialized and full of data.  

4. **Complete the parallel norm calculation:** Complete the parallelNorm() function to add up the localSum of all processes on the root process, then take the total sum of absolute values of  entries on the root process, stores that result as a float in totalNorm, then sends a copy of the totalNorm from the root process to all other processes. All processes should return their copy of totalNorm. (Writeup question 1: (1a) Which collective communications did you call for these operations? (1b) Describe how you decided on the arguments.)

5. **Run the tests and report:** Run the test. If you notice that your serial and parallel answers don't match, or if you notice that it works for some numbers of processes but not other numbers of processes, this is indicative of a bug. Fix the issues until you get the same answers in serial and parallel for all numbers of processes. (Writeup question #2: Copy the output of your slurm file.) 

6. **If you have any remaining errors:** you are required to include another question in your writeup. If you didn't have errors this is not required. (Writeup question #3: Describe in detail how these errors occur, and your strategy to isolate and debug these errors. You should include additional tests in a main function file called extraTests.c to demonstrate any errors.)

7. **References:**  In writeup/references.md make a list of any references you use and any collaborators you worked with. Note that you must also include a comment on any line of code that is based on code from class or a reference. If you completed this lab with a partner, you must include the breakdown of contributions by each partner. 

8. **Writeup:** In writeup/writeup.md answer the 2 (or 3 if you had errors remaining) writeup questions using complete sentences. Be sure your actual name(s) is(are) at the top (different from GitHub name).

9. **Submit:** Remove any binary executable files in your repository. You should have been committing code changes regularly. Be sure those changes are pushed to Github.

