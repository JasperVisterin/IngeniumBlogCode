import random
import matplotlib.pyplot as plt

def simulate_monty_hall(n_experiments=1000):
    """
    Simulate the Monty Hall problem n_experiments times.
    Show how often switching or staying wins.
    """
    # Success counts
    success_switch = 0
    success_keep = 0

    # Lists to store probabilities as the simulation runs
    switch_probabilities = []
    keep_probabilities = []

    # Repeat experiment many times
    for experiment in range(1, n_experiments + 1):
        # Step 1: Randomly choose where the car is
        car_door = random.choice([1, 2, 3])

        # Step 2: Player randomly picks a door
        player_choice = random.choice([1, 2, 3])

        # Step 3: Host opens a door that has a goat and is not the player's choice
        remaining_doors = [door for door in [1, 2, 3] if door != player_choice and door != car_door]
        host_opens = random.choice(remaining_doors)

        # Step 4: If player switches, they take the remaining closed door
        switch_choice = [door for door in [1, 2, 3] if door not in [player_choice, host_opens]][0]

        # Step 5: Check outcomes
        if switch_choice == car_door:
            success_switch += 1
        if player_choice == car_door:
            success_keep += 1

        # Record probabilities after each experiment
        switch_probabilities.append(success_switch / experiment)
        keep_probabilities.append(success_keep / experiment)

    plt.plot(range(1, n_experiments + 1), switch_probabilities, label="Switching doors")
    plt.plot(range(1, n_experiments + 1), keep_probabilities, label="Keeping same door")
    plt.axhline(2/3, color='green', linestyle='--', label='Expected (2/3)')
    plt.axhline(1/3, color='red', linestyle='--', label='Expected (1/3)')
    plt.xlabel("Number of experiments")
    plt.ylabel("Winning probability")
    plt.title("Monty Hall Simulation")
    plt.legend()
    plt.grid(True)
    plt.show()

    print(f"After {n_experiments} experiments:")
    print(f"Winning by switching: {success_switch / n_experiments:.3f}")
    print(f"Winning by keeping:   {success_keep / n_experiments:.3f}")

# Run the simulation
simulate_monty_hall(10000)
