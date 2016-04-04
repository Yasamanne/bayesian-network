# BayesianNetwork-MATLAB
<b>Instruction to Run the Bayesian Network</b>
<UL>
<li>For calculating the exact inference please run BayesianNetwork.m</li>
<li>generateSample.m is generating 1000 samples in csv file and reject the rows that the value of H or M is not equal to 1.</li>
<li>Createnode.m is for calculation the probability for nodes that doesn’t have parent.(probability = MeanValue)</li>
<li>twoParents.m is for calculating node p Probability that has two parents.</li>
<li>Threeparents.m for node “c” ,which is connected to two other nodes.</li>
<li>To see the approximate Inference results Please run ApproximateInference.m after you choose if you want the results for H or M the program starts running and generating samples. But because my computer is so slow I couldn’t get the final result.</li>
</UL>
