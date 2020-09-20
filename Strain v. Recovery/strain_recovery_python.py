import matplotlib.pyplot as plt

x = [7, 8, 9, 10, 11, 12, 13, 14]
strain_loc = [.62, .97, .96, .97, .98, .97, .93, .65]
recovery = [.54, .90, .74, .68, .73, .43, .62, .74]

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
ax.axis([6, 15, 0, 1.1])
ax.spines["right"].set_color("green")
ax.spines["left"].set_color("#4b6cc8")
ax.spines["top"].set_color("black")
ax.spines["bottom"].set_color("black")
plt.tick_params(
    axis='both',
    which='both',
    bottom=False,
    left=False
)
plt.show()
