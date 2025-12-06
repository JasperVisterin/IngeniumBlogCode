import random
import matplotlib.pyplot as plt

def simulate_random_distance(n_experiments=1000):
    """
    Simulate what the distance is between two randomly chosen points between 0 and 1.
    """
    # Success counts
    success_switch = 0
    success_keep = 0

    # Lists to store distances
    distances_average = []
    
    # Total distance 
    distance_sum = 0 

    # Repeat experiment many times
    for experiment in range(1, n_experiments + 1):
        # Step 1: Randomly choose x in the interval [0,1]
        x = random.random()

        # Step 2: Randomly choose y in the interval [0,1]
        y = random.random()

        # Step 3: Take the distance between x and y
        distance = abs(x-y)
        
        # Step 4: Add distance to the total sum
        distance_sum += distance

        # Record average distances after each experiment
        distances_average.append(distance_sum / experiment)

    plt.plot(range(1, n_experiments + 1), distances_average, label="Recorded Average Distance")
    plt.axhline(1/3, color='red', linestyle='--', label='Expected Distance (1/3)')
    plt.xlabel("Number of experiments")
    plt.ylabel("Recorded Average Distance")
    plt.title("Average distance between Two Random Points Simulation")
    plt.legend()
    plt.grid(True)
    plt.show()

    print(f"After {n_experiments} experiments:")
    print(f"Average Distance: {distance_sum / n_experiments:.3f}")

# Run the simulation
simulate_random_distance(10000)
