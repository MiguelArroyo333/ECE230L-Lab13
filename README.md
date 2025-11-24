# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

Summary

Today we learned about One Hot and Binary state machines and their differences.
## Lab Questions

### Compare and contrast One Hot and Binary encodings
  Binary encoding goes through each bit of each state, like State A would be 001, B is 010, etc. One Hot however is much simplier in that each bit is its own state and therefore is much easier to do.
### Which method did your team find easier, and why?
  Definitely the One Hot encoding, the logic was much trickier to figure out for the Binary encoding since we had to create logic for each of the digits.
### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
  Well for the FPGA, generally the One Hot is much better for its simplier logic and mass use of flip flops. Binary would be used if you wanted to minimize the amount of flip flops needed while One Hot is regarded as being faster.
