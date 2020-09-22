import matplotlib.pyplot as plt

x = [7, 8, 9, 10, 11, 12, 13, 14]
strain_loc = [.62, .97, .96, .97, .98, .97, .93, .65]
recovery = [.54, .90, .74, .68, .73, .43, .62, .74]
strain = [13.7, 20.2, 19.5, 20.6, 20.7, 20.6, 19.2, 14.1]

plt.style.use('dark_background')

fig, ax = plt.subplots()
ax.fill_between(x, recovery, strain_loc, color="#4b6cc8", alpha=0.1)
ax.plot(x, recovery, color="gray", linewidth=0.8, alpha=0.5)
ax.plot([8, 9, 10, 11, 14], [.90, .74, .68, .73, .74], 'go', markersize=10)
ax.plot([7, 12, 13], [.54, .43, .62], 'yo', markersize=10)
ax.plot(x, recovery, 'bo', color='black', markersize=6)
ax.plot(x, strain_loc, color="#4b6cc8", linewidth=1, alpha=0.8)
ax.plot(x, strain_loc, 'o', color="#4b6cc8", markersize=10, alpha=0.8)
ax.plot(x, strain_loc, 'o', color="black", markersize=6)
ax.plot([14.8, 14.8], [0, .32], color="red", markersize=3)
ax.plot([14.8, 14.8], [.34, .66], color="yellow", markersize=3)
ax.plot([14.8, 14.8], [.68, 1], color="green", markersize=3)
plt.annotate("0%", (15, 0), color="red")
plt.annotate("33%", (15, .315), color="red")
plt.annotate("66%", (15, .65), color="yellow")
plt.annotate("100%", (14.9, .99), color="green")
ax.plot([5.8, 5.8], [0, .15], color="#4b6cc8")
ax.plot([5.8, 5.8], [.17, .32], color="#4b6cc8")
ax.plot([5.8, 5.8], [.34, .485], color="#4b6cc8")
ax.plot([5.8, 5.8], [.505, .65], color="#4b6cc8")
ax.plot([5.8, 5.8], [.67, .82], color="#4b6cc8")
ax.plot([5.8, 5.8], [.84, .99], color="#4b6cc8")
ax.axis([5.5, 15.5, -0.1, 1.1])
plt.annotate(0, (6, 0), color="#4b6cc8")
plt.annotate(6, (6, .15), color="#4b6cc8")
plt.annotate(10, (6, .32), color="#4b6cc8")
plt.annotate(12, (6, .485), color="#4b6cc8")
plt.annotate(14, (6, .65), color="#4b6cc8")
plt.annotate(16, (6, .82), color="#4b6cc8")
plt.annotate(21, (6, .99), color="#4b6cc8")
ax.spines["right"].set_color("black")
ax.spines["left"].set_color("black")
ax.spines["top"].set_color("black")
ax.spines["bottom"].set_color("black")
plt.tick_params(
    axis='both',
    which='both',
    bottom=False
)
ax.get_yaxis().set_visible(False)
for i in range(0, 7):
    plt.annotate(strain[i], (x[i] - 0.2, strain_loc[i] + 0.05), color="#4b6cc8")
    if recovery[i] > 0.66:
        plt.annotate("{:.0%}".format(recovery[i]), (x[i] - 0.25, recovery[i] - 0.07), color="green")
    else:
        plt.annotate("{:.0%}".format(recovery[i]), (x[i] - 0.25, recovery[i] - 0.07), color="yellow")
plt.annotate(strain[7], (x[7] - 0.25, strain_loc[7] - 0.07), color="#4b6cc8")
plt.annotate("{:.0%}".format(recovery[7]), (x[7] - 0.2, recovery[7] + 0.05), color="green")
plt.title("WEEK 2")
plt.suptitle("TEAM EF - STRAIN V. RECOVERY")
plt.xticks((7, 8, 9, 10, 11, 12, 13, 14), ("MON\n7", "TUES\n8", "WED\n9", "THU\n10",
                                           "FRI\n11", "SAT\n12", "SUN\n13", "MON\n14"))
plt.show()
