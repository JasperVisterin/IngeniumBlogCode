import random
import matplotlib.pyplot as plt

def simulate_heads(n_experiments=1000):
    """
    Simulate how many times we need to throw a coin before we obtain heads.
    """

    # Lists to store the average amount of attempts before obtaining heads
    tries_average = []
    
    # Total distance 
    tries_sum = 0 
    
    # Repeat experiment many times
    for experiment in range(1, n_experiments + 1):
        # Define a boolean showing that we have not seen heads
        heads = False 
        
        while not heads:
            # Take a random number
            # if it is between 0 and 1/2 then it is tails
            # if it is between 1/2 and 1 then it is heads
            x = random.random()
            
            # update the amount of tries needed
            tries_sum += 1
            
            if x > 1/2:
                # it is heads: we stop our experiment
                heads = True
    
        # Record average distances after each experiment
        tries_average.append(tries_sum / experiment)

    plt.plot(range(1, n_experiments + 1), tries_average, label="Recorded Average Tries")
    plt.axhline(2, color='red', linestyle='--', label='Expected Tries (2)')
    plt.xlabel("Number of experiments")
    plt.ylabel("Recorded Average Tries Needed")
    plt.title("Average Tries needed before obtaining heads")
    plt.legend()
    plt.grid(True)
    plt.show()

    print(f"After {n_experiments} experiments:")
    print(f"Average Distance: {tries_sum / n_experiments:.3f}")

# Run the simulation
simulate_heads(10000)
